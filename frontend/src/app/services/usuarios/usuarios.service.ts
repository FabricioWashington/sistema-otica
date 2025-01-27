import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Usuario } from '../../models/usuario/usuario';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {
  private tipoLoginKey = 'tipoLogin';
  private nomeUsuarioKey = 'nomeUsuario';
  private idEmpresaKey = 'idEmpresa';
  private apiUrl = 'http://localhost:8080/api/usuarios';

  constructor(private http: HttpClient) { }

  getUsuarios(): Observable<Usuario[]> {
    return this.http.get<Usuario[]>(this.apiUrl);
  }

  postUsuario(usuario: Usuario): Observable<Usuario> {
    return this.http.post<Usuario>(this.apiUrl, usuario);
  }

  getUsuarioPorId(id: number): Observable<Usuario> {
    return this.http.get<Usuario>(`${this.apiUrl}/${id}`);
  }

  putUsuario(id: number, usuario: Usuario): Observable<Usuario> {
    return this.http.put<Usuario>(`${this.apiUrl}/${id}`, usuario);
  }

  deleteUsuario(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  setUserData(acesso: string, usuario: string): void {
    localStorage.setItem(this.tipoLoginKey, acesso);
    localStorage.setItem(this.nomeUsuarioKey, usuario);
  }

  getUserData(): { acesso: string; usuario: string } {
    const acesso = localStorage.getItem(this.tipoLoginKey) || '';
    const usuario = localStorage.getItem(this.nomeUsuarioKey) || '';
    return { acesso, usuario };
  }

  clearUserData(): void {
    localStorage.removeItem(this.tipoLoginKey);
    localStorage.removeItem(this.nomeUsuarioKey);
  }

  setUserEmpresaData(idEmpresa: number): void {
    localStorage.setItem(this.idEmpresaKey, idEmpresa.toString());
  }


  getUserEmpresaData(): { idEmpresa: number } {
    const idEmpresa = Number(localStorage.getItem(this.idEmpresaKey)) || 0;
    return { idEmpresa };
  }


  clearUserEmpresaData(): void {
    localStorage.removeItem(this.idEmpresaKey);
  }

}
