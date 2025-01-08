import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-caixa',
  standalone: false,

  templateUrl: './caixa.component.html',
  styleUrl: './caixa.component.scss'
})
export class CaixaComponent {
  constructor(private router: Router) {}

  navigateTo(path: string): void {
    this.router.navigate([path]);
  }
}
