import { Injectable } from '@angular/core';
import { environment } from '../../../../environment.prod';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, tap, throwError } from 'rxjs';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root',
})
export class LoginEmpresaService {
  private apiUrl = `${environment.apiUrl}/login-empresa`;

  constructor(private http: HttpClient, private usuarioService: UsuariosService) { }

  autenticar(cnpj: string, senha: string): Observable<any> {
    const params = new HttpParams().set('cnpj', cnpj).set('senha', senha);

    return this.http.post<any>(`${this.apiUrl}/auth`, null, {
      params,
      withCredentials: true,
    }).pipe(
      tap(response => {
        this.usuarioService.saveToken(response.token, response.empresa);
      })
    );
  }
}
