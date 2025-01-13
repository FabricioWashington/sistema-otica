import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuariosService } from '../../../../services/usuarios/usuarios.service';

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

  constructor(
    private readonly router: Router,
    private readonly usuarioService: UsuariosService,
  ) { }

  ngOnInit(): void {
    const userData = this.usuarioService.getUserData();
    this.tipoLogin = userData.acesso;
    this.nomeUsuario = userData.usuario;
  }


  toggleMenu() {
    //this.isMenuCollapsed = !this.isMenuCollapsed;
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
