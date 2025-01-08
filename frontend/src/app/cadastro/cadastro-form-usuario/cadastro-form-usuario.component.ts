import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-usuario',
  standalone: false,

  templateUrl: './cadastro-form-usuario.component.html',
  styleUrl: './cadastro-form-usuario.component.scss'
})
export class CadastroFormUsuarioComponent {
  hide = true;

  formData = {
    nomeCompleto: '',
    cpf: '',
    usuario: '',
    senha: '',
    acesso: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
      usuario: '',
      senha: '',
      acesso: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
