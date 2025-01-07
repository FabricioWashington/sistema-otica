import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CadastroRoutingModule } from './cadastro-routing.module';
import { CadastroComponent } from './cadastro/cadastro.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';
import { SharedModule } from '../shared/shared.module';
import { CadastroFormEmpresaComponent } from './cadastro-form-empresa/cadastro-form-empresa.component';
import { CadastroFormFuncionarioComponent } from './cadastro-form-funcionario/cadastro-form-funcionario.component';



@NgModule({
  declarations: [
    CadastroComponent,
    CadastroFormEmpresaComponent,
    CadastroFormFuncionarioComponent,
  ],
  imports: [
    CommonModule,
    CadastroRoutingModule,
    AppMaterialModule,
    SharedModule,
]
})
export class CadastroModule { }
