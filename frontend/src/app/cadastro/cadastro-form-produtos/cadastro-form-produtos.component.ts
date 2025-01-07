import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-produtos',
  standalone: false,

  templateUrl: './cadastro-form-produtos.component.html',
  styleUrl: './cadastro-form-produtos.component.scss'
})
export class CadastroFormProdutosComponent {
  formData = {
    nome: '',
    unidade: '',
    categoria: '',
    preco: '',
    codigoBarras: '',
    observacoes: '',
    imagem: null,
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nome: '',
      unidade: '',
      categoria: '',
      preco: '',
      codigoBarras: '',
      observacoes: '',
      imagem: null,
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }

  onSelectImage(): void {
    console.log('Seleção de imagem iniciada');
  }
}
