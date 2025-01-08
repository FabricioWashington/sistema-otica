import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { VendasComponent } from './vendas/vendas.component';
import { VendasBalcaoComponent } from './vendas-balcao/vendas-balcao.component';
import { VendasPagamentoComponent } from './vendas-pagamento/vendas-pagamento.component';

const routes: Routes = [
  {
    path: '',
    component: VendasComponent
  },
  {
    path: 'balcao',
    component: VendasBalcaoComponent
  },
  {
    path: 'pagamento',
    component: VendasPagamentoComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class VendasRoutingModule { }
