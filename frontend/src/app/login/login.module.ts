import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LoginRoutingModule } from './login-routing.module';
import { LoginComponent } from './login/login.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';
import { HttpClientModule } from '@angular/common/http';
import { SharedModule } from '../shared/shared.module';


@NgModule({
  declarations: [
    LoginComponent

  ],
  imports: [
    CommonModule,
    LoginRoutingModule,
    AppMaterialModule,
    HttpClientModule,
  ],
  exports:[
    LoginComponent
  ],
})
export class LoginModule { }
