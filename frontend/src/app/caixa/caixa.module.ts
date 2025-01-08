import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CaixaRoutingModule } from './caixa-routing.module';
import { CaixaComponent } from './caixa/caixa.component';
import { CaixaFormAberturaComponent } from './caixa-form-abertura/caixa-form-abertura.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';
import { CaixaFormFechamentoComponent } from './caixa-form-fechamento/caixa-form-fechamento.component';


@NgModule({
  declarations: [
    CaixaComponent,
    CaixaFormAberturaComponent,
    CaixaFormFechamentoComponent
  ],
  imports: [
    CommonModule,
    CaixaRoutingModule,
    AppMaterialModule,
  ]
})
export class CaixaModule { }
