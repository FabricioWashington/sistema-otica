import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { OrdemServicoRoutingModule } from './ordem-servico-routing.module';
import { OrdemServicoComponent } from './ordem-servico/ordem-servico.component';


@NgModule({
  declarations: [
    OrdemServicoComponent
  ],
  imports: [
    CommonModule,
    OrdemServicoRoutingModule
  ]
})
export class OrdemServicoModule { }
