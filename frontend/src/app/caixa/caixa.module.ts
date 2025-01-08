import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CaixaRoutingModule } from './caixa-routing.module';
import { CaixaComponent } from './caixa/caixa.component';
import { CaixaFormAberturaComponent } from './caixa-form-abertura/caixa-form-abertura.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';


@NgModule({
  declarations: [
    CaixaComponent,
    CaixaFormAberturaComponent
  ],
  imports: [
    CommonModule,
    CaixaRoutingModule,
    AppMaterialModule,
  ]
})
export class CaixaModule { }
