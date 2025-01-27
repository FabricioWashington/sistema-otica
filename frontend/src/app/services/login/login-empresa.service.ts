import { Injectable } from '@angular/core';
import { environment } from '../../../../environment.prod';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class LoginEmpresaService {
  private apiUrl = `${environment.apiUrl}/login-empresa`;

  constructor(private http: HttpClient) {}

  autenticar(cnpj: string, senha: string): Observable<number> {
    const params = new HttpParams()
      .set('cnpj', cnpj)
      .set('senha', senha);

    return this.http.post<number>(`${this.apiUrl}/auth`, null, { params });
  }

}
