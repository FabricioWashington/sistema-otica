import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-loading',
  standalone: false,

  templateUrl: './loading.component.html',
  styleUrl: './loading.component.scss'
})
export class LoadingComponent implements OnInit {
  progress = 0;
  percentageText = '0%';
  loading = true;

  @Output() onComplete = new EventEmitter<void>();

  ngOnInit(): void {
    this.startLoading();
    this.simularCarregamentoInicial();
  }

  startLoading(): void {
    const interval = setInterval(() => {
      this.progress += 5;
      this.percentageText = `${this.progress}%`;

      if (this.progress >= 100) {
        clearInterval(interval);
        this.onComplete.emit();
      }
    }, 50);
  }

  private simularCarregamentoInicial(): void {
    setTimeout(() => {
      const loadingOverlay = document.querySelector('.loading-overlay');
      if (loadingOverlay) {
        loadingOverlay.classList.add('hidden');
      }
      setTimeout(() => (this.loading = false), 1000);
    }, 2000);
  }
}
