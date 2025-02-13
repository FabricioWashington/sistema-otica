import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VendasRoutingModule } from './vendas-routing.module';
import { VendasComponent } from './vendas/vendas.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';
import { VendasBalcaoComponent } from './vendas-balcao/vendas-balcao.component';
import { VendasPagamentoComponent } from './vendas-pagamento/vendas-pagamento.component';


@NgModule({
  declarations: [
    VendasComponent,
    VendasBalcaoComponent,
    VendasPagamentoComponent
  ],
  imports: [
    CommonModule,
    VendasRoutingModule,
    AppMaterialModule,
  ]
})
export class VendasModule { }
