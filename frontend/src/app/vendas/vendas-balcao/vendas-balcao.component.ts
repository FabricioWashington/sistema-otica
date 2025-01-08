import { Component } from '@angular/core';
import { Produto } from '../../models/produto/produto';



const ELEMENT_DATA: Produto[] = [];

@Component({
  selector: 'app-vendas-balcao',
  standalone: false,

  templateUrl: './vendas-balcao.component.html',
  styleUrl: './vendas-balcao.component.scss'
})
export class VendasBalcaoComponent {
  displayedColumns: string[] = ['item', 'codigo', 'produto', 'quantidade', 'valorUnitario', 'valorTotal'];
  dataSource = ELEMENT_DATA;
  quantidade: number = 1;
  produtosSelecionados: Produto[] = [];

  produtoSelecionado = {
    nome: '',
    estoque: 0,
    valor: 'R$ 0,00',
  };

  constructor() { }

  ngOnInit(): void {
    document.addEventListener('keydown', (event) => {
      if (event.key === 'F1') {
        event.preventDefault();
        this.exibirModalAtalhos();
      }
    });
  }

  onPesquisarProduto(event: Event): void {
    const input = (event.target as HTMLInputElement).value;

    if (input.toLowerCase() === 'produto1') {
      this.produtoSelecionado = {
        nome: 'Produto 1',
        estoque: 10,
        valor: 'R$ 50,00',
      };

      this.adicionarProduto();
    }
  }

  adicionarProduto(): void {
    const produto: Produto = {
      item: this.produtosSelecionados.length + 1,
      codigo: '123456',
      produto: this.produtoSelecionado.nome,
      quantidade: this.quantidade,
      valorUnitario: parseFloat(this.produtoSelecionado.valor.replace('R$', '').replace(',', '.').trim()),
      valorTotal: this.quantidade * parseFloat(this.produtoSelecionado.valor.replace('R$', '').replace(',', '.').trim()),
    };

    this.produtosSelecionados.push(produto);
  }

  exibirModalAtalhos(): void {
    console.log('Abrindo modal de atalhos');

  }
}
