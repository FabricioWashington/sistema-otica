import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HeaderRoutingModule } from './header-routing.module';
import { HeaderComponent } from './header/header.component';
import { AppMaterialModule } from '../../app-material/app-material.module';


@NgModule({
  declarations: [
    HeaderComponent,
  ],
  imports: [
    CommonModule,
    HeaderRoutingModule,
    AppMaterialModule,
  ],
  exports:[
    HeaderComponent,
  ]
})
export class HeaderModule { }
