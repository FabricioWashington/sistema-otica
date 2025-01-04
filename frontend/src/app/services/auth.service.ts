import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private isAuthenticated = false;

  constructor(private router: Router) {}

  login(username: string, password: string): boolean {
    // Simulação de autenticação segura. Use chamadas HTTP reais em produção.
    if (username === 'admin' && password === '1234') {
      this.isAuthenticated = true;
      localStorage.setItem('token', 'fake-jwt-token'); // Salve um token (simulado aqui)
      return true;
    }
    return false;
  }

  logout(): void {
    this.isAuthenticated = false;
    localStorage.removeItem('token'); // Remova o token ao sair
    this.router.navigate(['/login']);
  }

  isLoggedIn(): boolean {
    return !!localStorage.getItem('token'); // Verifica se o token está salvo
  }
}
