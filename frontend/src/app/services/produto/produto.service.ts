import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Produto } from '../../models/produto/produto';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root'
})
export class ProdutoService {
  private apiUrl = `${environment.apiUrl}/produtos`;

  constructor(private http: HttpClient, private usuariosService: UsuariosService) { }

  getAll(): Observable<Produto[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<Produto[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<Produto> {
    return this.http.get<Produto>(`${this.apiUrl}/${id}`);
  }

  getByCodigo(nomeProduto: string): Observable<Produto> {
    return this.http.get<Produto>(`${this.apiUrl}/nome/${nomeProduto}`);
  }

  create(produto: Produto): Observable<Produto> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const produtoData = {...produto, idEmpresa};
    return this.http.post<Produto>(this.apiUrl, produtoData);
  }

  update(id: number, produto: Produto): Observable<Produto> {
    return this.http.put<Produto>(`${this.apiUrl}/${id}`, produto);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
