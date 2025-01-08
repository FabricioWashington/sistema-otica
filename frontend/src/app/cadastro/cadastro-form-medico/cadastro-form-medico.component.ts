import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-medico',
  standalone: false,

  templateUrl: './cadastro-form-medico.component.html',
  styleUrl: './cadastro-form-medico.component.scss'
})
export class CadastroFormMedicoComponent {
  formData = {
    nomeCompleto: '',
    inscricaoProfissional: '',
    ddd: '',
    contato: '',
    telefone: '',
    email: '',
    logradouro: '',
    bairro: '',
    numero: '',
    complemento: '',
    cep: '',
    uf: '',
    localidade: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      inscricaoProfissional: '',
      ddd: '',
      contato: '',
      telefone: '',
      email: '',
      logradouro: '',
      bairro: '',
      numero: '',
      complemento: '',
      cep: '',
      uf: '',
      localidade: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
