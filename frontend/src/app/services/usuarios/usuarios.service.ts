import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UsuariosService {
  private tipoLoginKey = 'tipoLogin';
  private nomeUsuarioKey = 'nomeUsuario';

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
}
