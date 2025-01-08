import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cadastro-form-marca',
  standalone: false,

  templateUrl: './cadastro-form-marca.component.html',
  styleUrl: './cadastro-form-marca.component.scss'
})
export class CadastroFormMarcaComponent {
  formData = {
    nomeMarca: '',
  };

  constructor(private router: Router) {}

  onSubmit(): void {
    console.log('Dados enviados:', this.formData);
  }

  onClear(): void {
    this.formData = {
      nomeMarca: '',
    };
    console.log('Campos limpos');
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
