import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ThemeService {
  private darkModeKey = 'darkMode';

  constructor() {
    this.loadTheme();
  }

  private loadTheme(): void {
    const isDarkMode = localStorage.getItem(this.darkModeKey) === 'enabled';
    this.setTheme(isDarkMode);
  }

  toggleTheme(): void {
    const isDarkMode = document.body.classList.contains('dark-mode');
    this.setTheme(!isDarkMode);
  }

  private setTheme(enableDark: boolean): void {
    if (enableDark) {
      document.body.classList.add('dark-mode');
      localStorage.setItem(this.darkModeKey, 'enabled');
    } else {
      document.body.classList.remove('dark-mode');
      localStorage.setItem(this.darkModeKey, 'disabled');
    }
  }
}
