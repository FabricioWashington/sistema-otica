import { Injectable } from '@angular/core';
import { environment } from '../../../../environment.prod';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { CookieService } from '../../shared/utils/cookies/cookie.service';

@Injectable({
  providedIn: 'root',
})
export class LoginEmpresaService {
  private apiUrl = `${environment.apiUrl}/login-empresa`;

  constructor(private http: HttpClient, private cookieService: CookieService ) {}

  autenticar(cnpj: string, senha: string): Observable<number> {
    const params = new HttpParams()
      .set('cnpj', cnpj)
      .set('senha', senha);

    return this.http.post<number>(`${this.apiUrl}/auth`, null, {
      params,
      withCredentials: true
    });
  }

  getEmpresaToken(): Observable<string> {
    const empresaNome = this.cookieService.getCookie("empresa_nome");

    if (!empresaNome) {
      console.error("Nome da empresa não encontrado nos cookies!");
      return throwError(() => new Error("Nome da empresa não encontrado nos cookies!"));
    }

    const headers = { "Empresa-Nome": empresaNome };

    return this.http.get<string>(`${this.apiUrl}/get-token`, { headers, withCredentials: true });
  }

}
