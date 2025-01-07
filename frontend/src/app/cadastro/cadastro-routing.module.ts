import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CadastroComponent } from './cadastro/cadastro.component';
import { CadastroFormEmpresaComponent } from './cadastro-form-empresa/cadastro-form-empresa.component';
import { CadastroFormFuncionarioComponent } from './cadastro-form-funcionario/cadastro-form-funcionario.component';

const routes: Routes = [
  {
    path: '',
    component: CadastroComponent,
  },
  {
    path: 'empresa',
    component: CadastroFormEmpresaComponent,
  },
  {
    path: 'funcionario',
    component: CadastroFormFuncionarioComponent,
  },
  { path: '**', redirectTo: '', pathMatch: 'full' },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CadastroRoutingModule { }
