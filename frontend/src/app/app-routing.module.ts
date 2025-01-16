import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home/home.component';
import { LoginComponent } from './login/login/login.component';
import { Error404Component } from './shared/error404/error404/error404.component';


const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: '404', component: Error404Component },
  { path: '**', redirectTo: '404' },
  {
    path: 'cadastro',
    loadChildren: () =>
      import('./cadastro/cadastro.module').then((m) => m.CadastroModule),
  },
  {
    path: 'caixa',
    loadChildren: () =>
      import('./caixa/caixa.module').then((m) => m.CaixaModule),
  },
  {
    path: 'estoque',
    loadChildren: () =>
      import('./estoque/estoque.module').then((m) => m.EstoqueModule),
  },
  {
    path: 'financeiro',
    loadChildren: () =>
      import('./financeiro/financeiro.module').then((m) => m.FinanceiroModule),
  },
  {
    path: 'movimentacao',
    loadChildren: () =>
      import('./movimentacao/movimentacao.module').then(
        (m) => m.MovimentacaoModule
      ),
  },
  {
    path: 'ordem-servico',
    loadChildren: () =>
      import('./ordem-servico/ordem-servico.module').then(
        (m) => m.OrdemServicoModule
      ),
  },
  {
    path: 'relatorios',
    loadChildren: () =>
      import('./relatorios/relatorios.module').then(
        (m) => m.RelatoriosModule
      ),
  },
  {
    path: 'vendas',
    loadChildren: () =>
      import('./vendas/vendas.module').then((m) => m.VendasModule),
  },
  {
    path: 'ecf',
    loadChildren: () => import('./ecf/ecf.module').then((m) => m.EcfModule),
  },
  {
    path: 'nfce',
    loadChildren: () =>
      import('./nfce/nfce.module').then((m) => m.NfceModule),
  },
];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
