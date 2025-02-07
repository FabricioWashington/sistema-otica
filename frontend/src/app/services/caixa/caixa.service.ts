import { Injectable } from '@angular/core';
import { environment } from '../../../../environment.prod';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Caixa } from '../../models/caixa/caixa';
import { Observable } from 'rxjs';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root'
})
export class CaixaService {
  private apiUrl = `${environment.apiUrl}/caixa`

  constructor(private http: HttpClient, private usuariosService: UsuariosService) { }

  abrirCaixa(caixa: Partial<Caixa>): Observable<Caixa> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const caixaData = { ...caixa, idEmpresa }
    return this.http.post<Caixa>(`${this.apiUrl}/abrir`, caixaData);
  }

  fecharCaixa(saldoFinal: number): Observable<Caixa> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const params = new HttpParams()
      .set('saldoFinal', saldoFinal.toString())
      .set('idEmpresa', idEmpresa.toString());
      return this.http.post<Caixa>(`${this.apiUrl}/fechar`, null, { params });
  }

  listarCaixas(): Observable<Caixa[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<Caixa[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  deletarCaixa(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

}
