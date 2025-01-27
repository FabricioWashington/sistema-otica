import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { LoginService } from '../../services/login/login.service';
import { TiposLogin } from '../../models/tipos-login/tipos-login';
import { HttpClient } from '@angular/common/http';
import { StatusService } from '../../services/status/status.service';
import { Router } from '@angular/router';
import { UsuariosService } from '../../services/usuarios/usuarios.service';
import { TiposLoginService } from '../../services/tipos-login/tipos-login.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';

@Component({
  selector: 'app-login',
  standalone: false,

  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {
  hide = true;
  loginUsuario: string = '';
  loginSenha: string = '';
  idTiposLogin: number | null = null;
  tiposLogin: TiposLogin[] = [];
  loginError: string | null = null;
  showPassword: boolean = false;
  statusInternet: boolean = false;
  statusCertificado: boolean = false;
  statusBancoDados: boolean = false;

  @ViewChild('showPasswordCheckbox') showPasswordCheckbox!: ElementRef;
  @ViewChild('passwordField') passwordField!: ElementRef;

  constructor(
    private loginService: LoginService,
    private tiposLoginService: TiposLoginService,
    private http: HttpClient,
    private statusService: StatusService,
    private router: Router,
    private usuarioService: UsuariosService,
    private _snackBar: MatSnackBar,
    private location: Location
  ) { }

  ngOnInit(): void {
    this.atualizarIconesStatus();
    this.getTiposLogin();
  }

  toggleShowPassword(): void {
    this.hide = !this.hide;
  }

  configurarMostrarSenha(): void {
    if (this.showPasswordCheckbox && this.showPasswordCheckbox.nativeElement &&
      this.passwordField && this.passwordField.nativeElement) {
      this.showPasswordCheckbox.nativeElement.addEventListener('change', () => {
        const fieldType = this.showPasswordCheckbox.nativeElement.checked ? 'text' : 'password';
        this.passwordField.nativeElement.type = fieldType;
      });
    } else {
      console.error('Elementos showPasswordCheckbox ou passwordField não encontrados.');
    }
  }

  getTiposLogin(): void {
    this.tiposLoginService.listarTiposLogin().subscribe(
      (tiposLogin: TiposLogin[]) => {
        this.tiposLogin = tiposLogin;
      },
      (error: any) => {
        console.error('Erro ao carregar os tipos de login:', error);
        this.loginError = 'Erro ao carregar os tipos de login.';
      }
    );
  }

  autenticar(): void {
    if (!this.loginUsuario || !this.loginSenha || !this.idTiposLogin) {
      this.onError('Por favor, preencha todos os campos.', 'Fechar', { duration: 3000 })
      return;
    }

    this.loginService
      .autenticar(this.loginUsuario, this.loginSenha, Number(this.idTiposLogin))
      .subscribe(
        (response: any) => {
          const tipoSelecionado = this.tiposLogin.find(
            (tipo) => tipo.id === this.idTiposLogin
          )?.tiposLogin;

          if (tipoSelecionado) {
            this.usuarioService.setUserData(tipoSelecionado, this.loginUsuario);
          }

          this.router.navigate(['/home']);
        },
        (error: any) => {
          console.error('Erro ao autenticar:', error);
          this.onError('Usuário ou senha inválidos.', 'Fechar', { duration: 3000 })
        }
      );
  }


  verificarConexaoInternet(): void {
    this.http.head('https://www.google.com', { observe: 'response' }).subscribe(
      () => {
        this.statusInternet = true;
        console.log('Conexão com a internet OK');
      },
      (error) => {
        this.statusInternet = false;
        this.onError('Erro ao verificar conexão com a internet.', 'Fechar', { duration: 3000 });
      }
    );
  }

  verificarCertificado(): void {
    // Simulação de verificação do certificado (você deve adaptar para sua lógica real)
    try {
      // Aqui deve estar a lógica de verificação do certificado
      const certificadoConfigurado = true; // Trocar pela lógica real
      this.statusCertificado = certificadoConfigurado;
      console.log('Certificado configurado corretamente');
    } catch (error) {
      this.statusCertificado = false;
      this.onError('Erro ao verificar o certificado.', 'Fechar', { duration: 3000 });
    }
  }

  verificarBancoDados(): void {
    this.statusService.verificarBancoDados().subscribe(
      (response: any) => {
        console.log(response.status);
        this.statusBancoDados = response.status === 'Banco de dados OK';
      },
      (error) => {
        this.onError('Erro ao conectar com o banco de dados.', 'Fechar', { duration: 3000 });
        this.statusBancoDados = false;
      }
    );
  }

  onCancel() {
    this.location.back();
  }

  private onError(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }

  private onSucess(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
    this.onCancel();
  }

  private showMessage(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }


  atualizarIconesStatus(): void {
    this.verificarConexaoInternet();
    this.verificarCertificado();
    this.verificarBancoDados();
  }



}
