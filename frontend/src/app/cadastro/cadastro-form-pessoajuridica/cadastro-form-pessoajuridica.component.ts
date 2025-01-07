import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-pessoajuridica',
  standalone: false,

  templateUrl: './cadastro-form-pessoajuridica.component.html',
  styleUrl: './cadastro-form-pessoajuridica.component.scss'
})
export class CadastroFormPessoajuridicaComponent {
  formData = {
    razaoSocial: '',
    nomeFantasia: '',
    inscricaoEstadual: '',
    inscricaoMunicipal: '',
    cnpj: '',
    email: '',
    ddd: '',
    contato: '',
    telefone: '',
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
      razaoSocial: '',
      nomeFantasia: '',
      inscricaoEstadual: '',
      inscricaoMunicipal: '',
      cnpj: '',
      email: '',
      ddd: '',
      contato: '',
      telefone: '',
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
