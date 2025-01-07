import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-pessoafisica',
  standalone: false,

  templateUrl: './cadastro-form-pessoafisica.component.html',
  styleUrl: './cadastro-form-pessoafisica.component.scss'
})
export class CadastroFormPessoafisicaComponent {
  formData = {
    nomeCompleto: '',
    cpf: '',
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
    municipio: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
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
      municipio: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
