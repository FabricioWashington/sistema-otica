import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ModalFormGenericComponent } from '../../shared/utils/modal/modal-form-generic/modal-form-generic.component';

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

  columns = [
    { key: 'referencia', label: 'Refêrencia' },
    { key: 'marca', label: 'Marca' },
    { key: 'tipoOculos', label: 'Tipo' },
    { key: 'quantidade', label: 'Qtde' },
    { key: 'cor', label: 'Cor' },
    { key: 'sexo', label: 'Sexo' }
  ];

  public titulo = "Armações";


  constructor(private router: Router,  private dialog: MatDialog) {}

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

  openModal(): void {
    const dialogRef = this.dialog.open(ModalFormGenericComponent, {
      width: '500px',
      data: {
        title: 'Cadastro de Armações',
        fields: [
          { name: 'referencia', label: 'Referência', value: this.formData.referencia },
          { name: 'marca', label: 'Marca', value: this.formData.marca },
          { name: 'tipoOculos', label: 'Tipo de Óculos', value: this.formData.tipoOculos },
          { name: 'quantidade', label: 'Quantidade', value: this.formData.quantidade, type: 'number' },
          { name: 'cor', label: 'Cor', value: this.formData.cor },
          { name: 'sexo', label: 'Sexo', value: this.formData.sexo }
        ]
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.formData = result;
        console.log('Dados atualizados:', this.formData);
      }
    });
  }
}
