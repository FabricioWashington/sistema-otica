import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CategoriaService } from '../../services/categoria/categoria.service';
import { Categoria } from '../../models/categoria/categoria';
import { ProdutoService } from '../../services/produto/produto.service';
import { Unidade } from '../../models/unidade/unidade';
import { UnidadeService } from '../../services/unidade/unidade.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';

@Component({
  selector: 'app-cadastro-form-produtos',
  standalone: false,

  templateUrl: './cadastro-form-produtos.component.html',
  styleUrl: './cadastro-form-produtos.component.scss'
})
export class CadastroFormProdutosComponent implements OnInit {
  produtoForm!: FormGroup;
  categorias: Categoria[] = [];
  unidades: Unidade[] = [];

  constructor(
    private router: Router,
    private categoriaService: CategoriaService,
    private produtoService: ProdutoService,
    private unidadeService: UnidadeService,
    private fb: FormBuilder,
    private _snackBar: MatSnackBar,
    private location: Location,
  ) { }

  ngOnInit(): void {
    this.initForm();
    this.loadCategorias();
    this.loadUnidades();
  }

  private initForm(): void {
    this.produtoForm = this.fb.group({
      nomeProduto: ['', Validators.required],
      unidade: ['', Validators.required],
      categoria: [null, Validators.required],
      preco: ['', [Validators.required, Validators.min(0)]],
      imagem: [''],
      codigoDeBarras: [''],
      observacoes: ['']
    });
  }

  isFieldInvalid(fieldName: string): boolean {
    const field = this.produtoForm.get(fieldName);
    return !!(field && field.invalid && (field.touched || field.dirty));
  }

  onSubmit(): void {
    if (this.produtoForm.invalid) {
      this.onError('Preencha todos os campos obrigatórios!', 'Fechar', { duration: 3000 });
      return;
    }

    const formData = {
      ...this.produtoForm.value,
      idCategoria: this.produtoForm.value.categoria
    };

    this.produtoService.create(formData).subscribe({
      next: () => {
        this.onSucess('Produto cadastrado com sucesso!', 'Fechar', { duration: 3000 });
        this.onClear();
      },
      error: () => {
        this.onError('Erro ao cadastrar produto.', 'Fechar', { duration: 3000 });
      }
    });
  }

  loadUnidades(): void {
    this.unidadeService.listarTodos().subscribe(data => {
      this.unidades = data;
    });
  }

  loadCategorias(): void {
    this.categoriaService.listarCategorias().subscribe((data) => {
      this.categorias = data;
    });
  }

  onClear(): void {
    this.produtoForm.reset();
    this._snackBar.open('Campos limpos.', 'Fechar', { duration: 3000 });
  }

  onCancel() {
    this.location.back();
  }

  private onError(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }

  private onSucess(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
    this.onCancel();
  }

  private showMessage(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }

  onSelectImage(): void {
    console.log('Seleção de imagem iniciada');
  }
}
