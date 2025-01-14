import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NavRoutingModule } from './nav-routing.module';
import { NavComponent } from './nav/nav.component';
import { AppMaterialModule } from '../../app-material/app-material.module';


@NgModule({
  declarations: [
    NavComponent
  ],
  imports: [
    CommonModule,
    NavRoutingModule,
    AppMaterialModule,
  ],
  exports: [NavComponent]
})
export class NavModule { }
