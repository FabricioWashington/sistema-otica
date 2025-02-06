import { Injectable } from '@angular/core';
import { environment } from '../../../../environment.prod';
import { HttpClient } from '@angular/common/http';
import { Unidade } from '../../models/unidade/unidade';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UnidadeService {
  private apiUrl = `${environment.apiUrl}/unidades`

  constructor(private http: HttpClient) { }

  listarTodos(): Observable<Unidade[]> {
    return this.http.get<Unidade[]>(this.apiUrl);
  }

  buscarPorId(id: number): Observable<Unidade> {
    return this.http.get<Unidade>(`${this.apiUrl}/${id}`);
  }

  criar(unidade: Unidade): Observable<Unidade> {
    return this.http.post<Unidade>(this.apiUrl, unidade);
  }

  atualizar(id: number, unidade: Unidade): Observable<Unidade> {
    return this.http.put<Unidade>(`${this.apiUrl}/${id}`, unidade);
  }

  deletar(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
