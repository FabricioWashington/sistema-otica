import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EcfRoutingModule } from './ecf-routing.module';
import { EcfComponent } from './ecf/ecf.component';


@NgModule({
  declarations: [
    EcfComponent
  ],
  imports: [
    CommonModule,
    EcfRoutingModule
  ]
})
export class EcfModule { }
