import { Component, Renderer2 } from '@angular/core';
import { Produto } from '../../models/produto/produto';
import { ProdutoService } from '../../services/produto/produto.service';



const ELEMENT_DATA: Produto[] = [];

@Component({
  selector: 'app-vendas-balcao',
  standalone: false,

  templateUrl: './vendas-balcao.component.html',
  styleUrl: './vendas-balcao.component.scss'
})
export class VendasBalcaoComponent {
  displayedColumns: string[] = ['item', 'codigoDeBarras', 'nomeProduto', 'quantidade', 'preco', 'valorTotal'];
  produtosSelecionados: Produto[] = [];
  produtosEncontrados: Produto[] = [];
  quantidade: number = 1;
  estoque: number = 0;

  produtoSelecionado: Produto | null = null;

  constructor(
    private renderer: Renderer2,
    private produtoService: ProdutoService,
  ) {}

  ngOnInit(): void {
    this.renderer.listen('document', 'keydown', (event: KeyboardEvent) => {
      if (event.key === 'F1') {
        event.preventDefault();
        this.exibirModalAtalhos();
      }
    });
  }

  onPesquisarProduto(event: Event): void {
    const input = (event.target as HTMLInputElement).value.trim();
    if (input.length < 2) return;

    this.produtoService.getByNome(input).subscribe({
      next: (response) => {
        this.produtosEncontrados = [response];
      },
      error: () => {
        console.error('Erro ao buscar produto');
        this.produtosEncontrados = [];
      }
    });
  }

  selecionarProduto(produto: Produto): void {
    this.produtoSelecionado = produto;
  }

  adicionarProduto(): void {
    if (!this.produtoSelecionado) {
      console.error('Nenhum produto selecionado!');
      return;
    }

    const produtoExistente = this.produtosSelecionados.find(p => p.codigoDeBarras === this.produtoSelecionado!.codigoDeBarras);
    if (produtoExistente) {
      produtoExistente.quantidade += this.quantidade;
      produtoExistente.valorTotal = produtoExistente.quantidade * produtoExistente.preco;
    } else {
      const novoProduto: Produto = {
        idProduto: this.produtoSelecionado.idProduto,
        nomeProduto: this.produtoSelecionado.nomeProduto,
        unidade: this.produtoSelecionado.unidade,
        categorias: this.produtoSelecionado.categorias,
        codigoDeBarras: this.produtoSelecionado.codigoDeBarras,
        imagem: this.produtoSelecionado.imagem,
        observacoes: this.produtoSelecionado.observacoes,
        preco: this.produtoSelecionado.preco,
        quantidade: this.quantidade,
        valorTotal: this.quantidade * this.produtoSelecionado.preco
      };

      this.produtosSelecionados.push(novoProduto);
    }

    this.produtoSelecionado = null;
    this.produtosEncontrados = [];
  }

  calcularTotal(): number {
    return this.produtosSelecionados.reduce((total, p) => total + p.valorTotal, 0);
  }

  calcularItens(): number {
    return this.produtosSelecionados.length;
  }

  calcularSaldo(): number {
    return this.calcularTotal();
  }

  exibirModalAtalhos(): void {
    console.log('Abrindo modal de atalhos');
  }
}
