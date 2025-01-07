import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {
  isMenuCollapsed: boolean = false;

  constructor(private readonly router: Router) { }



  toggleMenu() {
    //this.isMenuCollapsed = !this.isMenuCollapsed;
  }

  logout() {
    this.router.navigate(['/login']);
  }

  openConfig(){
    console.log("abrindo config")
  }

  openNotification(){
    console.log("abrindo notificação")
  }

}
