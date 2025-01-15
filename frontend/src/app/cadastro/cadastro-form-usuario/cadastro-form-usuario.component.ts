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
    private dialog: MatDialog,
    private _snackBar: MatSnackBar,
    private location: Location
  ) {}

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
    const usuarioData: Usuario = {
      idUsuario: 0,
      nomeCompleto: this.formData.nomeCompleto,
      cpf: this.formData.cpf,
      dataCadastro: new Date(),
      dataModificacao: new Date()
    };

    this.usuarioService.postUsuario(usuarioData).subscribe({
      next: (usuarioResponse) => {
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
          dataModificacao: new Date()
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

  private onError() {
    this._snackBar.open('Erro ao salvar curso!', 'Fechar', { duration: 3000 });
  }

  private onSucess() {
    this._snackBar.open('Curso salvo com sucesso!', 'Fechar', { duration: 3000 });
    this.onCancel();
  }
}
