import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VendasRoutingModule } from './vendas-routing.module';
import { VendasComponent } from './vendas/vendas.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';


@NgModule({
  declarations: [
    VendasComponent
  ],
  imports: [
    CommonModule,
    VendasRoutingModule,
    AppMaterialModule,
  ]
})
export class VendasModule { }
