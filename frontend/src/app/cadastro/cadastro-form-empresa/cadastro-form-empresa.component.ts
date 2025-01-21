import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-empresa',
  standalone: false,

  templateUrl: './cadastro-form-empresa.component.html',
  styleUrl: './cadastro-form-empresa.component.scss'
})
export class CadastroFormEmpresaComponent implements OnInit {

  formData: any = {
    cnpj: '',
    razaoSocial: '',
    nomeFantasia: '',
    indicadorIE: '',
    regimeTributario: '',
    inscricaoEstadual: '',
    logradouro: '',
    numero: '',
    complemento: '',
    bairro: '',
    uf: '',
    municipio: '',
    ddd: '',
    contato: '',
    telefone: '',
    email: '',
    certificado: null,
    senhaCertificado: '',
    urlCertificado: '',
    estadoCertificado: '',
    ambiente: ''
  };

  constructor(private router: Router) {}

  ngOnInit(): void {
  }

  onSubmit(): void {
    console.log('Dados do formulário enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      cnpj: '',
      razaoSocial: '',
      nomeFantasia: '',
      indicadorIE: '',
      regimeTributario: '',
      inscricaoEstadual: '',
      logradouro: '',
      numero: '',
      complemento: '',
      bairro: '',
      uf: '',
      municipio: '',
      ddd: '',
      contato: '',
      telefone: '',
      email: '',
      certificado: null,
      senhaCertificado: '',
      urlCertificado: '',
      estadoCertificado: '',
      ambiente: ''
    };
    console.log('Campos do formulário limpos');
  }

  onBack(): void {
    this.router.navigate(['/login-empresa']);
  }
}
