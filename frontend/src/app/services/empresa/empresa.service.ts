import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root'
})
export class EmpresaService {
  private apiUrl = `${environment.apiUrl}/empresa`;

  constructor(private http: HttpClient, private usuarioService: UsuariosService) { }

  cadastrarEmpresa(empresa: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/create`, empresa, {headers: this.usuarioService.getAuthHeaders()});
  }

  listarEmpresas(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}`, {headers: this.usuarioService.getAuthHeaders()});
  }

  buscarEmpresa(id: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${id}`, {headers: this.usuarioService.getAuthHeaders()});
  }

  atualizarEmpresa(id: number, empresa: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, empresa, {headers: this.usuarioService.getAuthHeaders()});
  }

  excluirEmpresa(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, {headers: this.usuarioService.getAuthHeaders()});
  }
}
