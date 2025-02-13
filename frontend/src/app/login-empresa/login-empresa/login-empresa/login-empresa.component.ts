import { HttpClient } from '@angular/common/http';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { LoginEmpresaService } from '../../../services/login/login-empresa.service';
import { UsuariosService } from '../../../services/usuarios/usuarios.service';
import { ValidationService } from '../../../shared/utils/validation/validation.service';
import { FormattingService } from '../../../shared/utils/formatting/formatting.service';

@Component({
  selector: 'app-login-empresa',
  standalone: false,

  templateUrl: './login-empresa.component.html',
  styleUrl: './login-empresa.component.scss'
})
export class LoginEmpresaComponent implements OnInit {
  hide = true;
  lembrarSenha = false;
  loginEmpresa: string = '';
  loginSenha: string = '';
  idTiposLogin: number | null = null;
  loginError: string | null = null;
  showPassword: boolean = false;

  @ViewChild('showPasswordCheckbox') showPasswordCheckbox!: ElementRef;
  @ViewChild('passwordField') passwordField!: ElementRef;

  constructor(
    private http: HttpClient,
    private router: Router,
    private _snackBar: MatSnackBar,
    private location: Location,
    private login: LoginEmpresaService,
    private usuario: UsuariosService,
    private formattingService: FormattingService,
  ) { }

  ngOnInit(): void {

  }


  autenticar() {
    if (!this.loginEmpresa || !this.loginSenha) {
      this.showMessage('Preencha todos os campos!', 'Fechar', { duration: 3000 });
      return;
    }

    this.login.autenticar(this.loginEmpresa, this.loginSenha).subscribe(
      (idEmpresa) => {
        console.log(idEmpresa);
        console.log('Autenticação bem-sucedida. ID da Empresa:', idEmpresa);
        this.usuario.setUserEmpresaData(idEmpresa);
        this.showMessage('Autenticação realizada com sucesso!', 'Fechar', { duration: 3000 });
        this.router.navigate(['/login']);
      },
      (error) => {
        console.error('Erro durante a autenticação:', error);
        this.showMessage('Credenciais inválidas!', 'Fechar', { duration: 3000 });
      }
    );
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

  aplicarMascaraCNPJ(event: any): void {
    const input = event.target;
    input.value = this.formattingService.maskCNPJ(input.value);
  }

  onCreateAccount(): void {
    this.router.navigate(['/cadastro/empresa']);
  }

  onForgotPassword(): void {
    this.router.navigate(['']);
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

}
