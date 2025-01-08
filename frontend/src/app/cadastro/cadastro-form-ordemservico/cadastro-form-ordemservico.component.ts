import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-ordemservico',
  standalone: false,

  templateUrl: './cadastro-form-ordemservico.component.html',
  styleUrl: './cadastro-form-ordemservico.component.scss'
})
export class CadastroFormOrdemservicoComponent {
  formData = {
    numeroOS: '',
    cliente: '',
    funcionario: '',
    medico: '',
    receita: '',
    produto: '',
    dataHoraEmissao: '',
    dataHoraEntrega: '',
    tipoServico: '',
    status: '',
    valor: '',
    valorEntrada: '',
    valorRestante: '',
    observacoes: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      numeroOS: '',
      cliente: '',
      funcionario: '',
      medico: '',
      receita: '',
      produto: '',
      dataHoraEmissao: '',
      dataHoraEntrega: '',
      tipoServico: '',
      status: '',
      valor: '',
      valorEntrada: '',
      valorRestante: '',
      observacoes: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
