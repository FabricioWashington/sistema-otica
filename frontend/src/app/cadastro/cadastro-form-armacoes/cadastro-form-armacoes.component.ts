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
    { key: 'referencia', label: 'Referência' },
    { key: 'marca', label: 'Marca' },
    { key: 'tipoOculos', label: 'Tipo' },
    { key: 'quantidade', label: 'Qtde' },
    { key: 'cor', label: 'Cor' },
    { key: 'sexo', label: 'Sexo' }
  ];

  data = [
    { referencia: 'A100', marca: 'Ray-Ban', tipo: 'Óculos de Grau', quantidade: 5, cor: 'Preto', sexo: 'Unissex' },
    { referencia: 'A200', marca: 'Oakley', tipo: 'Óculos de Sol', quantidade: 8, cor: 'Azul', sexo: 'Masculino' },
    { referencia: 'A300', marca: 'Prada', tipo: 'Óculos de Grau', quantidade: 3, cor: 'Vermelho', sexo: 'Feminino' }
  ];

  public titulo = "Armações";

  constructor(private router: Router, private dialog: MatDialog) {}

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

  openFormModal(title: string, item: any = null): void {
    const dialogRef = this.dialog.open(ModalFormGenericComponent, {
      width: '500px',
      data: {
        title: title,
        fields: [
          { name: 'referencia', label: 'Referência', value: item?.referencia || '' },
          { name: 'marca', label: 'Marca', value: item?.marca || '' },
          { name: 'tipoOculos', label: 'Tipo de Óculos', value: item?.tipo || '' },
          { name: 'quantidade', label: 'Quantidade', value: item?.quantidade || '', type: 'number' },
          { name: 'cor', label: 'Cor', value: item?.cor || '' },
          { name: 'sexo', label: 'Sexo', value: item?.sexo || '' }
        ]
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        if (item) {
          const index = this.data.findIndex(d => d.referencia === item.referencia);
          if (index !== -1) {
            this.data[index] = result;
            console.log('Dados editados:', this.data);
          }
        } else {
          this.data.push(result);
          console.log('Novo item adicionado:', result);
        }
      }
    });
  }

  openModal(): void {
    this.openFormModal('Cadastro de Armações');
  }

  openEdit(item: any): void {
    this.openFormModal('Editar Armação', item);
  }
}
