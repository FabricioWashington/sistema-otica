import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Login } from '../../models/login/login';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  private apiUrl = `${environment.apiUrl}/login`;

  constructor(private http: HttpClient) {}

  autenticar(loginUsuario: string, loginSenha: string, idTiposLogin: number): Observable<any> {
    const params = { loginUsuario, loginSenha, idTiposLogin };
    return this.http.post(`${this.apiUrl}/autenticar`, null, { params });
  }


  verificarUsuario(loginUsuario: string, idTiposLogin: number): Observable<boolean> {
    return this.http.post<boolean>(`${this.apiUrl}/verificar`, { loginUsuario, idTiposLogin });
  }

  postLogin(login: Login): Observable<Login> {
    return this.http.post<Login>(this.apiUrl, login);
  }


  getTiposLogin(): Observable<{ id: number; tiposLogin: string }[]> {
    return this.http.get<{ id: number; tiposLogin: string }[]>(
      `${this.apiUrl}/tipos-login`
    );
  }

}
