import { Component } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  standalone: false,
  styleUrl: './app.component.scss'
})
export class AppComponent {
  showHeader = false;
  title = 'sistema-otica-angular';
  loading = true;

  constructor(private router: Router) {
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        this.showHeader = event.url !== '/login';
      }
    });

    this.simularCarregamentoInicial();
  }

  private simularCarregamentoInicial(): void {
    setTimeout(() => {
      document.querySelector('.loading-overlay')?.classList.add('hidden');
      setTimeout(() => (this.loading = false), 500);
    }, 4800);
  }


  setLoading(isLoading: boolean): void {
    this.loading = isLoading;
  }
}
