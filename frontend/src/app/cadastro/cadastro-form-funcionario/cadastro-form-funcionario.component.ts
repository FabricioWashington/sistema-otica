import { Funcionario } from './../../models/funcionario/funcionario';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CargoFuncionario } from '../../models/cargo-funcionario/cargo-funcionario';
import { CargoFuncionarioService } from '../../services/cargo-funcionario/cargo-funcionario.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { ModalFormGenericComponent } from '../../shared/utils/modal/modal-form-generic/modal-form-generic.component';
import { MessageService } from '../../shared/utils/message/message.service';

@Component({
  selector: 'app-cadastro-form-funcionario',
  standalone: false,

  templateUrl: './cadastro-form-funcionario.component.html',
  styleUrl: './cadastro-form-funcionario.component.scss'
})
export class CadastroFormFuncionarioComponent implements OnInit{
  formData = {
    nomeCompleto: '',
    cpf: '',
    funcao: '',
  };

  columns = [
    { key: 'nomeCompleto', label: 'Nmoe' },
    { key: 'cpf', label: 'CPF' },
    { key: 'funcao', label: 'Função' },
  ];

  cargos: CargoFuncionario[] = [];
  funcionarios: Funcionario[] = [];
  funcionarioForm!: FormGroup;

  constructor(
    private router: Router,
    private cargoService: CargoFuncionarioService,
    private fb: FormBuilder,
    private dialog: MatDialog,
    private messageService: MessageService,
  ) { }

  ngOnInit(): void {
    this.initForm();
    this.loadCargos();
  }
  
  private initForm(): void {
      this.funcionarioForm = this.fb.group({
        nomeCompleto: ['', Validators.required],
        cpf: ['', Validators.required],
        idFuncao: [0, Validators.required],
      });
    }

    openModal(funcionarios?: Funcionario): void {
      const dialogRef = this.dialog.open(ModalFormGenericComponent, {
        width: '500px',
        data: {
          title: funcionarios ? 'Editar Funcionário' : 'Cadastro de Funcionário',
          fields: [
            { name: 'nomeCompleto', label: 'Nome', value: funcionarios?.nomeCompleto || '' },
            { name: 'cpf', label: 'CPF', value: funcionarios?.cpf || '' },
            { name: 'idFuncao', label: 'Função', value: funcionarios?.idFuncao || '' },
          ]
        }
      });
  
      dialogRef.afterClosed().subscribe(result => {
        if (result) {
          if (funcionarios) {
            const index = this.funcionarios.findIndex(m => m.cpf === funcionarios.cpf);
            if (index !== -1) {
              this.funcionarios[index] = result;
              this.messageService.showSuccess('Funcionário atualizado com sucesso!', 'Fechar');
            }
          } else {
            this.funcionarios.push(result);
            this.messageService.showSuccess('Funcionário cadastrado com sucesso!', 'Fechar');
          }
        }
      });
    }

    removeFuncionario(index: number): void {
      this.funcionarios.splice(index, 1);
      this.messageService.showSuccess('Funcionário removido com sucesso!', 'Fechar');
    }

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

  ///// loads
  loadCargos(): void {
    this.cargoService.getAll().subscribe((data) => {
      this.cargos = data;
    });
  }

}
