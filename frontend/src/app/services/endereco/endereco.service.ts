import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Endereco } from '../../models/endereco/endereco';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root',
})
export class EnderecoService {
  private apiUrl = `${environment.apiUrl}/enderecos`;

  constructor(private http: HttpClient) {}

  getAll(): Observable<Endereco[]> {
    return this.http.get<Endereco[]>(this.apiUrl);
  }

  getById(id: number): Observable<Endereco> {
    return this.http.get<Endereco>(`${this.apiUrl}/${id}`);
  }

  create(endereco: Endereco): Observable<Endereco> {
    return this.http.post<Endereco>(this.apiUrl, endereco);
  }

  update(id: number, endereco: Endereco): Observable<Endereco> {
    return this.http.put<Endereco>(`${this.apiUrl}/${id}`, endereco);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
