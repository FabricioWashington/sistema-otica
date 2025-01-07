import { CadastroFormPessoajuridicaComponent } from './cadastro-form-pessoajuridica/cadastro-form-pessoajuridica.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CadastroComponent } from './cadastro/cadastro.component';
import { CadastroFormEmpresaComponent } from './cadastro-form-empresa/cadastro-form-empresa.component';
import { CadastroFormFuncionarioComponent } from './cadastro-form-funcionario/cadastro-form-funcionario.component';
import { CadastroFormPessoafisicaComponent } from './cadastro-form-pessoafisica/cadastro-form-pessoafisica.component';
import { CadastroFormProdutosComponent } from './cadastro-form-produtos/cadastro-form-produtos.component';

const routes: Routes = [
  {
    path: '',
    component: CadastroComponent
  },
  {
    path: 'empresa',
    component: CadastroFormEmpresaComponent
  },
  {
    path: 'funcionario',
    component: CadastroFormFuncionarioComponent
  },
  {
    path: 'pessoafisica',
    component: CadastroFormPessoafisicaComponent
  },
  {
    path: 'pessoajuridica',
    component: CadastroFormPessoajuridicaComponent
  },
  {
    path: 'produtos',
    component: CadastroFormProdutosComponent
  },
  { path: '**', redirectTo: '', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CadastroRoutingModule { }
