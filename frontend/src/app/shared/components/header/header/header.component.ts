import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuariosService } from '../../../../services/usuarios/usuarios.service';
import { Location } from '@angular/common';
import { MENU_ITEMS } from '../../../menu/menu-items';

@Component({
  selector: 'app-header',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {
  tipoLogin: string = '';
  nomeUsuario: string = '';
  isMenuCollapsed: boolean = false;
  menuItems = MENU_ITEMS;

  constructor(
    private readonly router: Router,
    private readonly usuarioService: UsuariosService,
    private location: Location,
  ) { }

  ngOnInit(): void {
    this.userLoading();
  }

  expandMenu() {
    this.isMenuCollapsed = false;
  }

  collapseMenu() {
    this.isMenuCollapsed = true;
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

}
