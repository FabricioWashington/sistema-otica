import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-vendas',
  standalone: false,

  templateUrl: './vendas.component.html',
  styleUrl: './vendas.component.scss'
})
export class VendasComponent {
constructor(private router: Router) {}

  navigateTo(path: string): void {
    this.router.navigate([path]);
  }
}
