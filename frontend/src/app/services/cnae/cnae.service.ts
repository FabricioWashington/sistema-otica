import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CnaeService {
  private apiUrl = 'http://localhost:8080/api/cnae';

  constructor(private http: HttpClient) {}

  listarCNAEs(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
}
