import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuariosService } from '../../../../services/usuarios/usuarios.service';
import { NavigationService } from '../../../../services/navigation/navigation.service';

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

  constructor(
    private readonly router: Router,
    private readonly usuarioService: UsuariosService,
    public readonly navigationService: NavigationService,
  ) { }

  ngOnInit(): void {
    this.userLoading();
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
    this.router.navigate(['/#/login']);
  }

  openConfig() {
    console.log("abrindo config")
  }

  openNotification() {
    console.log("abrindo notificação")
  }

}
