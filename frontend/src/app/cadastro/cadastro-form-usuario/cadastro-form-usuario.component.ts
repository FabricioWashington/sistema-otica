import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TiposLogin } from '../../models/tipos-login/tipos-login';
import { LoginService } from '../../services/login/login.service';
import { TiposLoginService } from '../../services/tipos-login/tipos-login.service';
import { UsuariosService } from '../../services/usuarios/usuarios.service';
import { Usuario } from '../../models/usuario/usuario';
import { Login } from '../../models/login/login';
import { ErrorDialogComponent } from '../../shared/components/error-dialog/error-dialog.component';
import { MatDialog } from '@angular/material/dialog';
import { SuccessDialogComponent } from '../../shared/components/success-dialog/success-dialog/success-dialog.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';
import { ValidationService } from '../../shared/utils/validation/validation.service';
import { FormattingService } from '../../shared/utils/formatting/formatting.service';

@Component({
  selector: 'app-cadastro-form-usuario',
  standalone: false,

  templateUrl: './cadastro-form-usuario.component.html',
  styleUrl: './cadastro-form-usuario.component.scss'
})
export class CadastroFormUsuarioComponent implements OnInit {
  hide = true;

  idTiposLogin: number | null = null;
  tiposLogin: TiposLogin[] = [];

  formData = {
    nomeCompleto: '',
    cpf: '',
    usuario: '',
    senha: '',
    acesso: ''
  };

  constructor(
    private router: Router,
    private loginService: LoginService,
    private tiposLoginService: TiposLoginService,
    private usuarioService: UsuariosService,
    private validationService: ValidationService,
    private formattingService: FormattingService,
    private dialog: MatDialog,
    private _snackBar: MatSnackBar,
    private location: Location
  ) { }

  ngOnInit(): void {
    this.getTiposLogin();
  }

  getTiposLogin(): void {
    this.tiposLoginService.listarTiposLogin().subscribe({
      next: (tiposLogin: TiposLogin[]) => {
        this.tiposLogin = tiposLogin;
      },
      error: () => {
        this.showErrorDialog('Erro', 'Erro ao carregar os tipos de login.');
      }
    });
  }

  onSubmit(): void {
    if (!this.validationService.validateCPF(this.formData.cpf)) {
      this.onError('CPF inválido!', 'Fechar', { duration: 3000 });
      return;
    }
    const usuarioData: Usuario = {
      idUsuario: 0,
      nomeCompleto: this.formData.nomeCompleto,
      cpf: this.formData.cpf,
      dataCadastro: new Date(),
      dataModificacao: new Date(),
      idEmpresa: 0,
    };

    this.usuarioService.postUsuario(usuarioData).subscribe({
      next: (usuarioResponse) => {
        console.log(usuarioResponse);
        if (!usuarioResponse.idUsuario) {
          return;
        }

        const loginData: Login = {
          idlogin: 0,
          loginUsuario: this.formData.usuario,
          loginSenha: this.formData.senha,
          tiposLogin: { id: parseInt(this.formData.acesso, 10), tiposLogin: '' },
          idUsuario: usuarioResponse.idUsuario,
          dataCadastro: new Date(),
          dataModificacao: new Date(),
          idEmpresa: 0,
        };

        this.loginService.postLogin(loginData).subscribe({
          next: () => {
            this.showSuccessDialog('Sucesso', 'Cadastro realizado com sucesso!');
            this.router.navigate(['cadastro/usuario']);
          },
          error: () => {
            this.showErrorDialog('Erro', 'Erro ao cadastrar o login.');
          }
        });
      },
      error: () => {
        this.showErrorDialog('Erro', 'Erro ao cadastrar o usuário.');
      }
    });
  }

  aplicarMascaraCPF(event: any): void {
    const input = event.target;
    input.value = this.formattingService.maskCPF(input.value);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
      usuario: '',
      senha: '',
      acesso: ''
    };
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
  }

  private showSuccessDialog(title: string, message: string): void {
    this.dialog.open(SuccessDialogComponent, {
      data: { title, message },
      width: '400px'
    });
  }

  private showErrorDialog(title: string, message: string): void {
    this.dialog.open(ErrorDialogComponent, {
      data: { title, message },
      width: '400px'
    });
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
