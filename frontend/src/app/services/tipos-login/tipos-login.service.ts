import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TiposLogin } from '../../models/tipos-login/tipos-login';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root',
})
export class TiposLoginService {
  private apiUrl = `${environment.apiUrl}/tipos-login`;

  constructor(
    private http: HttpClient,
    private usuariosService: UsuariosService
  ) { }

  listarTiposLogin(): Observable<any[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<any[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  criarTipoLogin(tiposLogin: any): Observable<any> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    tiposLogin.idEmpresa = idEmpresa;
    return this.http.post<any>(this.apiUrl, tiposLogin);
  }

  atualizarTiposLogin(id: number, tiposLogin: TiposLogin): Observable<TiposLogin> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...tiposLogin, idEmpresa };
    return this.http.put<TiposLogin>(`${this.apiUrl}/${id}`, body);
  }

  deletarTiposLogin(id: number): Observable<void> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const empresa = { idEmpresa }
    return this.http.delete<void>(`${this.apiUrl}/${id}?idEmpresa=${empresa}`);
  }
}
