import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Categoria } from '../../models/categoria/categoria';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment.prod';
import { UsuariosService } from '../usuarios/usuarios.service';

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {
  private apiUrl = `${environment.apiUrl}/categoria`;

  constructor(
    private http: HttpClient,
    private usuariosService: UsuariosService
  ) {}

  listarCategorias(): Observable<Categoria[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<Categoria[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  cadastrarCategoria(categoria: Categoria): Observable<Categoria> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...categoria, idEmpresa };
    return this.http.post<Categoria>(this.apiUrl, body);
  }

  atualizarCategoria(id: number, categoria: Categoria): Observable<Categoria> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...categoria, idEmpresa };
    return this.http.put<Categoria>(`${this.apiUrl}/${id}`, body);
  }

  excluirCategoria(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

}
