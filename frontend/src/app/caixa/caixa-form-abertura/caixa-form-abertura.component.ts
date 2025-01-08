import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-caixa-form-abertura',
  standalone: false,

  templateUrl: './caixa-form-abertura.component.html',
  styleUrl: './caixa-form-abertura.component.scss'
})
export class CaixaFormAberturaComponent {
  formData = {
    saldoInicial: '',
    nomeOperador: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      saldoInicial: '',
      nomeOperador: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
