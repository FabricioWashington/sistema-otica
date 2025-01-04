import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NfceRoutingModule } from './nfce-routing.module';
import { NfceComponent } from './nfce/nfce.component';


@NgModule({
  declarations: [
    NfceComponent
  ],
  imports: [
    CommonModule,
    NfceRoutingModule
  ]
})
export class NfceModule { }
