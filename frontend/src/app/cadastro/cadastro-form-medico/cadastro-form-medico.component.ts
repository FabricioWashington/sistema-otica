import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MessageService } from '../../shared/utils/message/message.service';
import { Medico } from '../../models/medico/medico';
import { ModalFormGenericComponent } from '../../shared/utils/modal/modal-form-generic/modal-form-generic.component';
import { MedicoService } from '../../services/medico/medico.service';

@Component({
  selector: 'app-cadastro-form-medico',
  standalone: false,
  templateUrl: './cadastro-form-medico.component.html',
  styleUrls: ['./cadastro-form-medico.component.scss']
})
export class CadastroFormMedicoComponent implements OnInit {
  medicoForm!: FormGroup;
  medicos: Medico[] = [];

  columns = [
    { key: 'nome', label: 'Nome' },
    { key: 'registroProfissional', label: 'Inscrição Profissional' },
    { key: 'logradouro', label: 'Logradouro' },
    { key: 'telefone', label: 'Telefone' },
    { key: 'email', label: 'Email' }
  ];

  constructor(
    private router: Router,
    private fb: FormBuilder,
    private dialog: MatDialog,
    private messageService: MessageService,
    private medicoService: MedicoService,
  ) {}

  ngOnInit(): void {
    this.initForm();
    this.loadMedicos();
  }

  private initForm(): void {
    this.medicoForm = this.fb.group({
      nomeCompleto: ['', Validators.required],
      registroProfissional: ['', Validators.required],
      telefone: ['', Validators.required],
      logradouro: ['', Validators.required],
      bairro: ['', Validators.required],
      cep: ['', Validators.required],
      uf: ['', Validators.required],
      telefone2: '',
      email: ['', [Validators.required, Validators.email]]
    });
  }

  openModal(medico?: Medico): void {
    const dialogRef = this.dialog.open(ModalFormGenericComponent, {
      width: '500px',
      data: {
        title: medico ? 'Editar Médico' : 'Cadastro de Médico',
        fields: [
          { name: 'nome', label: 'Nome', value: medico?.nome || '' },
          { name: 'registroProfissional', label: 'Inscrição Profissional', value: medico?.registroProfissional || '' },
          { name: 'logradouro', label: 'Logradouro', value: medico?.logradouro || '' },
          { name: 'bairro', label: 'Bairro', value: medico?.bairro || '' },
          { name: 'numero', label: 'Número', value: medico?.numero || '' },
          { name: 'cep', label: 'CEP', value: medico?.cep || '' },
          { name: 'uf', label: 'UF', value: medico?.registroProfissional || '' },
          { name: 'municipio', label: 'Municipio', value: medico?.municipio || '' },
          { name: 'complemento', label: 'Complemento', value: medico?.complemento || '' },
          { name: 'email', label: 'E-mail', value: medico?.email || '' },
          { name: 'telefone', label: 'Telefone', value: medico?.telefone || '' },
          { name: 'telefone2', label: 'Contato', value: medico?.telefone2 || '' },
        ]
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        if (medico) {
          const index = this.medicos.findIndex(m => m.registroProfissional === medico.registroProfissional);
          if (index !== -1) {
            this.medicos[index] = result;
            this.messageService.showSuccess('Médico atualizado com sucesso!', 'Fechar');
          }
        } else {
          this.medicos.push(result);
          this.messageService.showSuccess('Médico cadastrado com sucesso!', 'Fechar');
        }
      }
    });
  }

  removeMedico(index: number): void {
    this.medicos.splice(index, 1);
    this.messageService.showSuccess('Médico removido com sucesso!', 'Fechar');
  }

    //// loads
    loadMedicos() {
      this.medicoService.getAll().subscribe({
        next: (response) => {
          this.medicos = response;
        }
      });
    }
}
