import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CadastroRoutingModule } from './cadastro-routing.module';
import { CadastroComponent } from './cadastro/cadastro.component';
import { AppMaterialModule } from '../shared/app-material/app-material.module';
import { SharedModule } from '../shared/shared.module';
import { CadastroFormEmpresaComponent } from './cadastro-form-empresa/cadastro-form-empresa.component';
import { CadastroFormFuncionarioComponent } from './cadastro-form-funcionario/cadastro-form-funcionario.component';
import { CadastroFormPessoafisicaComponent } from './cadastro-form-pessoafisica/cadastro-form-pessoafisica.component';
import { CadastroFormPessoajuridicaComponent } from './cadastro-form-pessoajuridica/cadastro-form-pessoajuridica.component';
import { CadastroFormProdutosComponent } from './cadastro-form-produtos/cadastro-form-produtos.component';
import { CadastroFormUsuarioComponent } from './cadastro-form-usuario/cadastro-form-usuario.component';



@NgModule({
  declarations: [
    CadastroComponent,
    CadastroFormEmpresaComponent,
    CadastroFormFuncionarioComponent,
    CadastroFormPessoafisicaComponent,
    CadastroFormPessoajuridicaComponent,
    CadastroFormProdutosComponent,
    CadastroFormUsuarioComponent,
  ],
  imports: [
    CommonModule,
    CadastroRoutingModule,
    AppMaterialModule,
    SharedModule,
]
})
export class CadastroModule { }
