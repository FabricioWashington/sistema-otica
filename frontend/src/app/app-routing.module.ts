import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MovimentacaoComponent } from './movimentacao/movimentacao/movimentacao.component';
import { FinanceiroComponent } from './financeiro/financeiro/financeiro.component';
import { EstoqueComponent } from './estoque/estoque/estoque.component';
import { CadastroComponent } from './cadastro/cadastro/cadastro.component';
import { CaixaComponent } from './caixa/caixa/caixa.component';
import { HomeComponent } from './home/home/home.component';
import { LoginComponent } from './login/login/login.component';
import { OrdemServicoComponent } from './ordem-servico/ordem-servico/ordem-servico.component';
import { RelatoriosComponent } from './relatorios/relatorios/relatorios.component';
import { VendasComponent } from './vendas/vendas/vendas.component';
import { EcfComponent } from './ecf/ecf/ecf.component';
import { NfceComponent } from './nfce/nfce/nfce.component';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: 'cadastro', component: CadastroComponent },
  { path: 'caixa', component: CaixaComponent },
  { path: 'estoque', component: EstoqueComponent },
  { path: 'financeiro', component: FinanceiroComponent },
  { path: 'movimentacao', component: MovimentacaoComponent },
  { path: 'ordem-servico', component: OrdemServicoComponent },
  { path: 'relatorios', component: RelatoriosComponent },
  { path: 'vendas', component: VendasComponent },
  { path: 'ecf', component: EcfComponent },
  { path: 'nfce', component: NfceComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
