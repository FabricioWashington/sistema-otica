import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { VendasComponent } from './vendas/vendas.component';
import { VendasBalcaoComponent } from './vendas-balcao/vendas-balcao.component';

const routes: Routes = [
  {
    path: '',
    component: VendasComponent
  },
  {
    path: 'balcao',
    component: VendasBalcaoComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class VendasRoutingModule { }
