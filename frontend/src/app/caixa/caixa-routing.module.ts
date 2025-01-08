import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CaixaComponent } from './caixa/caixa.component';
import { CaixaFormAberturaComponent } from './caixa-form-abertura/caixa-form-abertura.component';
import { CaixaFormFechamentoComponent } from './caixa-form-fechamento/caixa-form-fechamento.component';

const routes: Routes = [
  {
    path: '',
    component: CaixaComponent
  },
  {
    path: 'abertura',
    component: CaixaFormAberturaComponent
  },
  {
    path: 'fechamento',
    component: CaixaFormFechamentoComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CaixaRoutingModule { }
