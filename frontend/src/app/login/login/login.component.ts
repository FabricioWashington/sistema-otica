import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { LoginService } from '../../services/login/login.service';

@Component({
  selector: 'app-login',
  standalone: false,

  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {
  loginUsuario: string = '';
  loginSenha: string = '';
  idTiposLogin: string = '';
  tiposLogin: { id: string; nome: string }[] = [];
  loginError: string = '';

  @ViewChild('showPasswordCheckbox') showPasswordCheckbox!: ElementRef;
  @ViewChild('passwordField') passwordField!: ElementRef;

  constructor(private readonly loginService: LoginService) {}

  ngOnInit(): void {
    this.getTiposLogin();
  }

  ngAfterViewInit(): void {
    this.configurarMostrarSenha();
  }

  configurarMostrarSenha(): void {
    this.showPasswordCheckbox.nativeElement.addEventListener('change', () => {
      const fieldType = this.showPasswordCheckbox.nativeElement.checked ? 'text' : 'password';
      this.passwordField.nativeElement.type = fieldType;
    });
  }

  getTiposLogin(): void {
    this.loginService.getTiposLogin().subscribe(
      (response: any) => {
        this.tiposLogin = response;
      },
      (error: any) => {
        console.error('Erro ao carregar os tipos de login:', error);
        this.loginError = 'Erro ao carregar as opções de login.';
      }
    );
  }

  autenticar(): void {
    if (!this.loginUsuario || !this.loginSenha || !this.idTiposLogin) {
      this.loginError = 'Por favor, preencha todos os campos.';
      return;
    }

    this.loginService
      .autenticar(this.loginUsuario, this.loginSenha, Number(this.idTiposLogin))
      .subscribe(
        (response: any) => {
          console.log('Login bem-sucedido:', response);
          window.location.href = '/home';
        },
        (error: any) => {
          console.error('Erro ao autenticar:', error);
          this.loginError = 'Usuário ou senha inválidos.';
        }
      );
  }
}
