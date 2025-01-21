import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LoginEmpresaRoutingModule } from './login-empresa-routing.module';
import { LoginEmpresaComponent } from './login-empresa/login-empresa/login-empresa.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';


@NgModule({
  declarations: [
    LoginEmpresaComponent
  ],
  imports: [
    CommonModule,
    LoginEmpresaRoutingModule,
    AppMaterialModule,
    HttpClientModule,
  ],
  exports: [
    LoginEmpresaComponent
  ],
})
export class LoginEmpresaModule { }
