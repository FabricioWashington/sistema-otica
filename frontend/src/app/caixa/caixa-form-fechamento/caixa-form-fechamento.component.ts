import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-caixa-form-fechamento',
  standalone: false,

  templateUrl: './caixa-form-fechamento.component.html',
  styleUrl: './caixa-form-fechamento.component.scss'
})
export class CaixaFormFechamentoComponent {
  formData = {
    saldoInicial: '',
    nomeOperador: '',
    saldoFinal: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      saldoInicial: '',
      nomeOperador: '',
      saldoFinal: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/caixa']);
    console.log('Redirecionando para caixa');
  }

  onVoltar(): void {
    console.log('Voltar acionado.');
    this.router.navigate(['/']);
  }

  onExibirHistorico(): void {
    console.log('Exibir Histórico acionado.');
  }
}
