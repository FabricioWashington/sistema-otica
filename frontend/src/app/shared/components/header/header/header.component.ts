import { Component } from '@angular/core';
import { AuthService } from '../../../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {
  isMenuCollapsed: boolean = false;

  constructor(private readonly authService: AuthService, private readonly router: Router) { }


  toggleMenu() {
    console.log('Electron toggleMenu chamado');
    this.isMenuCollapsed = !this.isMenuCollapsed;

    if ((window as any).electron) {
      (window as any).electron.send('menu-toggled', this.isMenuCollapsed);
    }
  }

  logout() {
    console.log('Electron logout chamado');
    if ((window as any).electron) {
      (window as any).electron.send('logout');
    }
  }

  openConfig(){
    console.log("abrindo config")
  }

  openNotification(){
    console.log("abrindo notificação")
  }

}
