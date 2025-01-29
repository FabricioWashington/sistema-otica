import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Location } from '@angular/common';
import { ContatoService } from '../../services/contato/contato.service';
import { EnderecoService } from '../../services/endereco/endereco.service';
import { MedicoService } from '../../services/medico/medico.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-cadastro-form-medico',
  standalone: false,
  templateUrl: './cadastro-form-medico.component.html',
  styleUrls: ['./cadastro-form-medico.component.scss']
})
export class CadastroFormMedicoComponent implements OnInit{
  medicoForm!: FormGroup;

  constructor(
    private router: Router,
    private contatoService: ContatoService,
    private enderecoService: EnderecoService,
    private medicoService: MedicoService,
    private _snackBar: MatSnackBar,
    private location: Location,
    private fb: FormBuilder,
  ) {}

  ngOnInit(): void {
    this.initForm();
  }

  private initForm(): void {
    this.medicoForm = this.fb.group({
      nomeCompleto: ['', Validators.required],
      inscricaoProfissional: ['', Validators.required],
      telefone: ['', Validators.required],
      telefone2: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      logradouro: ['', Validators.required],
      bairro: ['', Validators.required],
      numero: ['', Validators.required],
      complemento: [''],
      cep: ['', Validators.required],
      uf: ['', Validators.required],
      localidade: ['', Validators.required],
      municipio: ['', Validators.required]
    });
  }

  isFieldInvalid(fieldName: string): boolean {
    const field = this.medicoForm.get(fieldName);
    return !!(field && field.invalid && (field.touched || field.dirty));
  }


  onSubmit(): void {
    if (this.medicoForm.invalid) {
      this._snackBar.open('Preencha todos os campos obrigatórios!', 'Fechar', { duration: 3000 });
      return;
    }

    const formData = this.medicoForm.value;

    const contatoData = {
      telefone: formData.telefone,
      email: formData.email
    };

    this.contatoService.create(contatoData).subscribe({
      next: (contatoResponse) => {
        const idContato = contatoResponse.idContato;

        if (!idContato) {
          this.onError('Erro ao obter ID do contato.', 'Fechar', { duration: 3000 });
          return;
        }

        const enderecoData = {
          logradouro: formData.logradouro,
          bairro: formData.bairro,
          numero: formData.numero,
          complemento: formData.complemento,
          cep: formData.cep,
          uf: formData.uf,
          localidade: formData.localidade,
          municipio: formData.municipio
        };

        this.enderecoService.create(enderecoData).subscribe({
          next: (enderecoResponse) => {
            const idEndereco = enderecoResponse.idEndereco;

            if (!idEndereco) {
              this.onError('Erro ao obter ID do endereço.', 'Fechar', { duration: 3000 });
              return;
            }

            const medicoData = {
              nome: formData.nomeCompleto,
              registroProfissional: formData.inscricaoProfissional,
              idEndereco: idEndereco,
              idContato: idContato
            };

            this.medicoService.create(medicoData).subscribe({
              next: () => {
                this._snackBar.open('Médico cadastrado com sucesso!', 'Fechar', { duration: 3000 });
              },
              error: () => {
                this._snackBar.open('Erro ao cadastrar médico.', 'Fechar', { duration: 3000 });
              }
            });
          },
          error: () => {
            this._snackBar.open('Erro ao cadastrar endereço.', 'Fechar', { duration: 3000 });
          }
        });
      },
      error: () => {
        this._snackBar.open('Erro ao cadastrar contato.', 'Fechar', { duration: 3000 });
      }
    });
  }

  onClear(): void {
    this.medicoForm.reset();
    this._snackBar.open('Campos limpos.', 'Fechar', { duration: 3000 });
  }

  onCancel() {
    this.location.back();
  }

  private onError(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }

  private onSucess(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
    this.onCancel();
  }

  private showMessage(message: string, action: string, config: { duration: number }): void {
    this._snackBar.open(message, action, config);
  }

  onBack(): void {
    this.router.navigate(['/cadastro']);
    console.log('Redirecionando para cadastro');
  }
}
