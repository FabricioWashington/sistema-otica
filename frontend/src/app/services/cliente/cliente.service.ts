import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Cliente } from '../../models/cliente/cliente';
import { UsuariosService } from '../usuarios/usuarios.service';
import { environment } from '../../../../environment.prod';

@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  private apiUrl = `${environment.apiUrl}/clientes`;

  constructor(private http: HttpClient, private usuariosService: UsuariosService) {}

  getAll(): Observable<Cliente[]> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    return this.http.get<Cliente[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  getById(id: number): Observable<Cliente> {
    return this.http.get<Cliente>(`${this.apiUrl}/${id}`);
  }

  create(cliente: Cliente): Observable<Cliente> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...cliente, idEmpresa };
    return this.http.post<Cliente>(this.apiUrl, body);
  }

  update(id: number, cliente: Cliente): Observable<Cliente> {
    const { idEmpresa } = this.usuariosService.getUserEmpresaData();
    const body = { ...cliente, idEmpresa };
    return this.http.put<Cliente>(`${this.apiUrl}/${id}`, body);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
