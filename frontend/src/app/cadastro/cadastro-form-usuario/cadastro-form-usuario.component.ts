import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TiposLogin } from '../../models/tipos-login/tipos-login';
import { LoginService } from '../../services/login/login.service';
import { TiposLoginService } from '../../services/tipos-login/tipos-login.service';
import { UsuariosService } from '../../services/usuarios/usuarios.service';

@Component({
  selector: 'app-cadastro-form-usuario',
  standalone: false,

  templateUrl: './cadastro-form-usuario.component.html',
  styleUrl: './cadastro-form-usuario.component.scss'
})
export class CadastroFormUsuarioComponent implements OnInit{
  hide = true;

  loginUsuario: string = '';
  loginSenha: string = '';
  idTiposLogin: number | null = null;
  tiposLogin: TiposLogin[] = [];
  loginError: string | null = null;

  formData = {
    nomeCompleto: '',
    cpf: '',
    usuario: '',
    senha: '',
    acesso: '',
  };

  constructor(
    private router: Router,
    private loginService: LoginService,
    private tiposLoginService: TiposLoginService,
    private usuarioService: UsuariosService,
  ) { }

  ngOnInit(): void {
    this.getTiposLogin();
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

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
      usuario: '',
      senha: '',
      acesso: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
