import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class StatusService {
  private apiUrl = 'http://localhost:8080/api';

  constructor(private http: HttpClient) { }

  verificarBancoDados(): Observable<string> {
    return this.http.get<string>(`${this.apiUrl}/status-banco`);
  }

}
