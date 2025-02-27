import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Usuario } from '../../models/usuario/usuario';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment';

@Injectable({
  providedIn: 'root',
})
export class UsuariosService {
  private tipoLoginKey = 'tipoLogin';
  private nomeUsuarioKey = 'nomeUsuario';
  private idEmpresaKey = 'idEmpresa';
  private tokenKey = 'token';
  private empresaKey = 'empresa';
  private apiUrl = `${environment.apiUrl}/usuarios`;

  constructor(private http: HttpClient) {}

  getUsuarios(): Observable<Usuario[]> {
    const { idEmpresa } = this.getUserEmpresaData();
    return this.http.get<Usuario[]>(`${this.apiUrl}?idEmpresa=${idEmpresa}`);
  }

  postUsuario(usuario: Usuario): Observable<Usuario> {
    const { idEmpresa } = this.getUserEmpresaData();
    const body = { ...usuario, idEmpresa};
    return this.http.post<Usuario>(this.apiUrl, body);
  }

  getUsuarioPorId(id: number): Observable<Usuario> {
    const { idEmpresa } = this.getUserEmpresaData();
    return this.http.get<Usuario>(`${this.apiUrl}/${id}?idEmpresa=${idEmpresa}`);
  }

  putUsuario(id: number, usuario: Usuario): Observable<Usuario> {
    const { idEmpresa } = this.getUserEmpresaData();
    const body = { ...usuario, idEmpresa };
    return this.http.put<Usuario>(`${this.apiUrl}/${id}`, body);
  }

  deleteUsuario(id: number): Observable<void> {
    const { idEmpresa } = this.getUserEmpresaData();
    return this.http.delete<void>(`${this.apiUrl}/${id}?idEmpresa=${idEmpresa}`);
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

  //// token
  saveToken(token: string, empresa: string): void {
    localStorage.setItem(this.tokenKey, token);
    localStorage.setItem(this.empresaKey, empresa);
  }

  getToken(): string | null {
    return localStorage.getItem(this.tokenKey);
  }

  getEmpresa(): string | null {
    return localStorage.getItem(this.empresaKey);
  }

  removeToken(): void {
    localStorage.removeItem(this.tokenKey);
    localStorage.removeItem(this.empresaKey);
  }

  isAuthenticated(): boolean {
    return this.getToken() !== null;
  }
}
