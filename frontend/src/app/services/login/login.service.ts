import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  private apiUrl = 'http://localhost:8080/api/login';

  constructor(private http: HttpClient) {}

  autenticar(loginUsuario: string, loginSenha: string, idTiposLogin: number): Observable<any> {
    return this.http.post(`${this.apiUrl}/autenticar`, { loginUsuario, loginSenha, idTiposLogin });
  }

  verificarUsuario(loginUsuario: string, idTiposLogin: number): Observable<boolean> {
    return this.http.post<boolean>(`${this.apiUrl}/verificar`, { loginUsuario, idTiposLogin });
  }

  salvar(login: any): Observable<any> {
    return this.http.post(this.apiUrl, login);
  }

  getTiposLogin(): Observable<{ id: number; nome: string }[]> {
    return this.http.get<{ id: number; nome: string }[]>(
      `${this.apiUrl}/tipos-login`
    );
  }
}
