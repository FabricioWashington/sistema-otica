import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-funcionario',
  standalone: false,

  templateUrl: './cadastro-form-funcionario.component.html',
  styleUrl: './cadastro-form-funcionario.component.scss'
})
export class CadastroFormFuncionarioComponent {
  formData = {
    nomeCompleto: '',
    cpf: '',
    funcao: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados do formulário enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
      funcao: '',
    };
    console.log('Campos do formulário limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionado para a tela de cadastro');
  }
}
