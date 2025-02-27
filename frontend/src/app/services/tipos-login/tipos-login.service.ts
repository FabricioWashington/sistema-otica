import { HttpClient, HttpHeaders } from '@angular/common/http';
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
    private usuariosService: UsuariosService,
  ) {}

  private getAuthHeaders(): HttpHeaders {
    const token = this.usuariosService.getToken();
    // console.log("token enviado: ", token);
    return new HttpHeaders().set('Authorization', `Bearer ${token}`);
  }

  listarTiposLogin(): Observable<any[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const url = idEmpresa ? `${this.apiUrl}?idEmpresa=${idEmpresa}` : this.apiUrl;

    return this.http.get<any[]>(url, {
      headers: this.getAuthHeaders(),
    });
  }

  criarTipoLogin(tiposLogin: any): Observable<any> {
    return this.http.post<any>(this.apiUrl, tiposLogin, {
      headers: this.getAuthHeaders(),
    });
  }

  buscarPorId(id: number): Observable<TiposLogin> {
    return this.http.get<TiposLogin>(`${this.apiUrl}/${id}`, {
      headers: this.getAuthHeaders(),
    });
  }

  atualizarTiposLogin(id: number, tiposLogin: TiposLogin): Observable<TiposLogin> {
    return this.http.put<TiposLogin>(`${this.apiUrl}/${id}`, tiposLogin, {
      headers: this.getAuthHeaders(),
    });
  }

  deletarTiposLogin(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`, {
      headers: this.getAuthHeaders(),
    });
  }
}
