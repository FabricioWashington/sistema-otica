import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Login } from '../../models/login/login';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';
import { CookieService } from '../../shared/utils/cookies/cookie.service';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  private apiUrl = `${environment.apiUrl}/login`;

  constructor(
    private http: HttpClient,
    private usuariosService: UsuariosService,
    private cookieService: CookieService,
  ) { }

  autenticar(
    loginUsuario: string,
    loginSenha: string,
    idTiposLogin: number
  ): Observable<any> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const params = { loginUsuario, loginSenha, idTiposLogin, idEmpresa };
    return this.http.post(`${this.apiUrl}/autenticar`, null, {
      params,
      withCredentials: true
    });
  }

  verificarUsuario(
    loginUsuario: string,
    idTiposLogin: number
  ): Observable<boolean> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { loginUsuario, idTiposLogin, idEmpresa };
    return this.http.post<boolean>(`${this.apiUrl}/verificar`, body);
  }

  postLogin(login: Login): Observable<Login> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...login, idEmpresa }
    return this.http.post<Login>(this.apiUrl, body);
  }


  getTiposLogin(): Observable<{ id: number; tiposLogin: string }[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const empresa = { idEmpresa }
    return this.http.get<{ id: number; tiposLogin: string }[]>(
      `${this.apiUrl}/tipos-login?idEmpresa=${empresa}`
    );
  }

}
