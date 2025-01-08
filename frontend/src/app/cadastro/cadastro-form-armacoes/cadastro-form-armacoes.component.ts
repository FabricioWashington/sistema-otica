import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-armacoes',
  standalone: false,

  templateUrl: './cadastro-form-armacoes.component.html',
  styleUrl: './cadastro-form-armacoes.component.scss'
})
export class CadastroFormArmacoesComponent {
  formData = {
    referencia: '',
    marca: '',
    tipoOculos: '',
    quantidade: '',
    cor: '',
    sexo: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      referencia: '',
      marca: '',
      tipoOculos: '',
      quantidade: '',
      cor: '',
      sexo: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
