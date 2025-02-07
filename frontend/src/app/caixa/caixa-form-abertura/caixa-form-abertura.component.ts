import { MessageService } from './../../shared/utils/message/message.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CaixaService } from '../../services/caixa/caixa.service';
import { Caixa } from '../../models/caixa/caixa';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';

@Component({
  selector: 'app-caixa-form-abertura',
  standalone: false,

  templateUrl: './caixa-form-abertura.component.html',
  styleUrl: './caixa-form-abertura.component.scss'
})
export class CaixaFormAberturaComponent implements OnInit{
  caixas: Caixa[] = [];
  saldoInicial: number = 0;
  operador: string = '';

  constructor(
    private router: Router,
    private caixaService: CaixaService,
    private messageService: MessageService,
  ) {}

  ngOnInit(): void {

  }

  abrirCaixa(): void {
    if (!this.operador || this.saldoInicial <= 0) {
      this.messageService.showMessage('Preencha os campos corretamente!', 'Fechar');
      return;
    }

    const novoCaixa: Partial<Caixa> = {
      saldoInicial: this.saldoInicial,
      operador: this.operador,
    };

    this.caixaService.abrirCaixa(novoCaixa).subscribe({
      next: () => {
        this.messageService.showSuccess('Caixa aberto com sucesso!', 'Fechar');
        this.router.navigate(['/vendas/balcao']);
        this.onClear();
      },
      error: () => this.messageService.showError('Erro ao abrir caixa', 'Fechar')
    });
  }

  onClear(): void {
    this.saldoInicial = 0;
    this.operador = '';
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
