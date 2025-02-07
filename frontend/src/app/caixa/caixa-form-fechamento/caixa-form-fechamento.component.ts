import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Caixa } from '../../models/caixa/caixa';
import { CaixaService } from '../../services/caixa/caixa.service';
import { MessageService } from '../../shared/utils/message/message.service';

@Component({
  selector: 'app-caixa-form-fechamento',
  standalone: false,

  templateUrl: './caixa-form-fechamento.component.html',
  styleUrl: './caixa-form-fechamento.component.scss'
})
export class CaixaFormFechamentoComponent {
  caixas: Caixa[] = [];
  saldoFinal: number = 0;

  constructor(
    private router: Router,
    private caixaService: CaixaService,
    private messageService: MessageService,
  ) { }

  fecharCaixa(): void {
    if (this.saldoFinal <= 0) {
      this.messageService.showMessage('Informe um saldo final válido!', 'Fechar');
      return;
    }

    this.caixaService.fecharCaixa(this.saldoFinal).subscribe({
      next: () => {
        this.messageService.showSuccess('Caixa fechado com sucesso!', 'Fechar');
        // this.listarVendas();
        // listar todos os dados do caixa, vendas e etc.
      },
      error: () => this.messageService.showError('Erro ao fechar caixa', 'Fechar')
    });
  }

  onClear(): void {
    this.saldoFinal = 0;
  }

  onBack(): void {
    this.router.navigate(['/caixa']);
    console.log('Redirecionando para caixa');
  }

  onVoltar(): void {
    console.log('Voltar acionado.');
    this.router.navigate(['/']);
  }

  onExibirHistorico(): void {
    console.log('Exibir Histórico acionado.');
  }
}
