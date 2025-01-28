import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ContatoService } from '../../services/contato/contato.service';
import { EnderecoService } from '../../services/endereco/endereco.service';
import { ClienteService } from '../../services/cliente/cliente.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { PessoaFisicaService } from '../../services/cliente/pessoa-fisica.service';
import { Location } from '@angular/common';

@Component({
  selector: 'app-cadastro-form-pessoafisica',
  standalone: false,
  templateUrl: './cadastro-form-pessoafisica.component.html',
  styleUrl: './cadastro-form-pessoafisica.component.scss',
})
export class CadastroFormPessoafisicaComponent {

  idEndereco: number = 0;
  idClientes: number = 0;
  idContato: number = 0;

  formData = {
    nomeCompleto: '',
    cpf: '',
    telefone: '',
    telefone2: '',
    email: '',
    logradouro: '',
    bairro: '',
    numero: '',
    complemento: '',
    cep: '',
    uf: '',
    municipio: '',
  };

  constructor(
    private router: Router,
    private contatoService: ContatoService,
    private enderecoService: EnderecoService,
    private clienteService: ClienteService,
    private pessoaFisicaService: PessoaFisicaService,
    private _snackBar: MatSnackBar,
    private location: Location
  ) { }

  onSubmit(): void {
    const {
      nomeCompleto,
      cpf,
      telefone,
      telefone2,
      email,
      logradouro,
      bairro,
      numero,
      complemento,
      cep,
      uf,
      municipio,
    } = this.formData;

    const contatoData = { email, telefone, telefone2 };

    this.contatoService.create(contatoData).subscribe({
      next: (contatoResponse) => {
        const idContato = contatoResponse.idContato;

        if (!idContato) {
          this.onError('Erro ao obter ID do contato.', 'Fechar', { duration: 3000 });
          return;
        }

        const enderecoData = { logradouro, bairro, numero, complemento, cep, uf, municipio };

        this.enderecoService.create(enderecoData).subscribe({
          next: (enderecoResponse) => {
            const idEndereco = enderecoResponse.idEndereco;

            if (!idEndereco) {
              this.onError('Erro ao obter ID do endereço.', 'Fechar', { duration: 3000 });
              return;
            }

            const clienteData = {
              cpf,
              nome: nomeCompleto,
              idEndereco,
              idContato,
              dataCadastro: new Date(),
              dataModificacao: new Date(),
            };

            this.clienteService.create(clienteData).subscribe({
              next: (clienteResponse) => {
                const idCliente = clienteResponse.idClientes;

                if (!idCliente) {
                  this.onError('Erro ao obter ID do cliente.', 'Fechar', { duration: 3000 });
                  return;
                }

                const pessoaFisicaData = {
                  cpf,
                  nomeCompleto,
                  idCliente,
                };

                this.pessoaFisicaService.create(pessoaFisicaData).subscribe({
                  next: () => {
                    this.onSucess('Cadastro realizado com sucesso!', 'Fechar', { duration: 3000 });
                  },
                  error: () => {
                    this.onError('Erro ao cadastrar Pessoa Física.', 'Fechar', { duration: 3000 });
                  },
                });
              },
              error: () => {
                this.onError('Erro ao cadastrar Cliente.', 'Fechar', { duration: 3000 });
              },
            });
          },
          error: () => {
            this.onError('Erro ao cadastrar Endereço.', 'Fechar', { duration: 3000 });
          },
        });
      },
      error: () => {
        this.onError('Erro ao cadastrar Contato.', 'Fechar', { duration: 3000 });
      },
    });
  }

  onClear(): void {
    this.formData = {
      nomeCompleto: '',
      cpf: '',
      telefone: '',
      telefone2: '',
      email: '',
      logradouro: '',
      bairro: '',
      numero: '',
      complemento: '',
      cep: '',
      uf: '',
      municipio: '',
    };
    console.log('Campos limpos');
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
