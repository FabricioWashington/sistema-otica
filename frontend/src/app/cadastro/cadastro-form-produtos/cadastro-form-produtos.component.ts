import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CategoriaService } from '../../services/categoria/categoria.service';
import { Categoria } from '../../models/categoria/categoria';

@Component({
  selector: 'app-cadastro-form-produtos',
  standalone: false,

  templateUrl: './cadastro-form-produtos.component.html',
  styleUrl: './cadastro-form-produtos.component.scss'
})
export class CadastroFormProdutosComponent implements OnInit{
  formData = {
    nome: '',
    unidade: '',
    categoria: '',
    preco: '',
    codigoBarras: '',
    observacoes: '',
    imagem: null,
  };
  categorias: Categoria[] = [];

  constructor(
    private router: Router,
    private categoriaService: CategoriaService,
  ) {}

  ngOnInit(): void {
    this.loadCategorias();
  }

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  loadCategorias(): void {
    this.categoriaService.listarCategorias().subscribe((data) => {
      this.categorias = data;
    });
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
