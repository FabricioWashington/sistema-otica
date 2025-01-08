import { Component } from '@angular/core';
import { Pagamento } from '../../models/pagamento/pagamento';

@Component({
  selector: 'app-vendas-pagamento',
  standalone: false,

  templateUrl: './vendas-pagamento.component.html',
  styleUrl: './vendas-pagamento.component.scss'
})
export class VendasPagamentoComponent {
  displayedColumns: string[] = ['item', 'codigo', 'descricao', 'valorRecebido'];
  dataSource: Pagamento[] = [];
  formasPagamento = ['Dinheiro', 'Cartão', 'Pix'];
  clientes = ['Cliente 1', 'Cliente 2', 'Cliente 3'];
  vendedores = ['Vendedor 1', 'Vendedor 2', 'Vendedor 3'];

  clienteSelecionado: string = '';
  vendedorSelecionado: string = '';
  cpf: string = '';
  formaPagamento: string = '';
  valorRecebimento: number = 0;
  desconto: number = 0;
  totalReceber: number = 0;
  faltam: number = 0;

  adicionarRecebimento(): void {
    if (this.valorRecebimento > 0 && this.formaPagamento) {
      const recebimento: Pagamento = {
        item: this.dataSource.length + 1,
        codigo: '123',
        descricao: this.formaPagamento,
        valorRecebido: this.valorRecebimento,
      };
      this.dataSource.push(recebimento);
      this.calcularTotais();
      this.valorRecebimento = 0; // Limpar campo
    }
  }

  calcularTotais(): void {
    const totalRecebido = this.dataSource.reduce((sum, item) => sum + item.valorRecebido, 0);
    this.faltam = this.totalReceber - totalRecebido - this.desconto;
  }
}
