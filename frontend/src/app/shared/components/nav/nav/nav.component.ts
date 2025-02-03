import { EmpresaService } from './../../../../services/empresa/empresa.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuariosService } from '../../../../services/usuarios/usuarios.service';
import { NavigationService } from '../../../../services/navigation/navigation.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';
import { ThemeService } from '../../../../services/theme/theme.service';

@Component({
  selector: 'app-nav',
  standalone: false,

  templateUrl: './nav.component.html',
  styleUrl: './nav.component.scss'
})
export class NavComponent implements OnInit {
  tipoLogin: string = '';
  nomeUsuario: string = '';
  isMenuOpen: boolean = false;
  nomeFantasia: string = '';
  razaoSocial: string = '';
  idEmpresa: number = 0;
  isDarkMode: boolean = false;

  constructor(
    private router: Router,
    private usuarioService: UsuariosService,
    public navigationService: NavigationService,
    private empresaService: EmpresaService,
    private _snackBar: MatSnackBar,
    private location: Location,
    private themeService: ThemeService,
  ) { }

  ngOnInit(): void {
    this.userLoading();
    this.obterNomeEmpresa(this.idEmpresa);
    this.isDarkMode = localStorage.getItem("darkMode") === "enabled";
  }


  toggleTheme(): void {
    this.isDarkMode = !this.isDarkMode;
    this.themeService.toggleTheme();
  }

  obterNomeEmpresa(idEmpresa: number): void {
    const userData = this.usuarioService.getUserEmpresaData();
    this.idEmpresa = userData.idEmpresa;
    this.empresaService.buscarEmpresa(userData.idEmpresa).subscribe(
      (empresa) => {
        this.razaoSocial = empresa.razaoSocial;
        this.nomeFantasia = empresa.nomeFantasia;
      },
      (error) => {
        this.onError('Erro ao carregar nome da empresa.', 'Fechar', { duration: 3000 });
        console.error('Erro ao buscar a empresa', error);
      }
    )

  }

  onMenuOpened(): void {
    this.isMenuOpen = true;
  }

  onMenuClosed(): void {
    this.isMenuOpen = false;
  }

  userLoading(): void {
    const userData = this.usuarioService.getUserData();
    this.tipoLogin = userData.acesso;
    this.nomeUsuario = userData.usuario;
  }

  logout() {
    this.usuarioService.clearUserData();
    this.router.navigate(['/login']);
  }

  openConfig() {
    console.log("abrindo config")
  }

  openNotification() {
    console.log("abrindo notificação")
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
