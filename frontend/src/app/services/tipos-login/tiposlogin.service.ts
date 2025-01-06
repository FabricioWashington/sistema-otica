import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TiposLogin } from '../../models/tipos-login/tipos-login';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TiposloginService {
  private apiUrl = 'http://localhost:8080/api/login/tipos-login'

  constructor(private http: HttpClient) {}

  listarTiposLogin(): Observable<TiposLogin[]> {
    return this.http.get<TiposLogin[]>(this.apiUrl);
  }
}
