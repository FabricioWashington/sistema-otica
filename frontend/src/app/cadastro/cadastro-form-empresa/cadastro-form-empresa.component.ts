import { ChangeDetectionStrategy, ChangeDetectorRef, Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { MatSnackBar } from '@angular/material/snack-bar';
import { EmpresaService } from '../../services/empresa/empresa.service';
import { ValidationService } from '../../shared/utils/validation/validation.service';
import { FormattingService } from '../../shared/utils/formatting/formatting.service';
import { CnaeService } from '../../services/cnae/cnae.service';
import { Cnae } from '../../models/cnae/cnae';
import { Empresa } from '../../models/empresa/empresa';
import { MessageService } from '../../shared/utils/message/message.service';

@Component({
  selector: 'app-cadastro-form-empresa',
  standalone: false,

  templateUrl: './cadastro-form-empresa.component.html',
  styleUrl: './cadastro-form-empresa.component.scss',
})
export class CadastroFormEmpresaComponent implements OnInit {
  hide = true;
  senha: string = '';
  cnaes: Cnae[] = [];
  empresas: any[] = [];
  empresaSelecionada: any = null;

  formData: Empresa = {
    cnpj: '',
    razaoSocial: '',
    nomeFantasia: '',
    indicadorIE: '',
    regimeTributario: '',
    inscricaoEstadual: '',
    senha: '',
    idCnae: null,
    enderecoDTO: {
      cep: '',
      logradouro: '',
      numero: '',
      complemento: '',
      bairro: '',
      uf: '',
      municipio: ''
    },
    contatoDTO: {
      telefone: '',
      telefone2: '',
      email: ''
    }
  };



  constructor(
    private empresaService: EmpresaService,
    private router: Router,
    private _snackBar: MatSnackBar,
    private location: Location,
    private validationService: ValidationService,
    private formattingService: FormattingService,
    private messageService: MessageService,
    private cnaeService: CnaeService,
  ) { }

  ngOnInit(): void {
    this.loadEmpresas();
    this.loadCNAEs();
  }


  onSubmit(): void {
    // if (!this.validationService.validateCNPJ(this.formData.cnpj)) {
    //   this.onError('CNPJ inválido!', 'Fechar');
    //   return;
    // }
    console.log('Dados enviados:', this.formData);
    this.empresaService.cadastrarEmpresa(this.formData).subscribe(
      () => {
        this._snackBar.open('Cadastro realizado com sucesso!', 'Fechar');
        this.router.navigate(['/login-empresa']);
      },
      (error) => {
        console.error('Erro ao cadastrar a empresa:', error);
        console.log('Detalhes do erro:', error.error);
        this.messageService.showError('Erro ao cadastrar a empresa. Tente novamente!', 'Fechar');
      }
    );
  }

  consultarEmpresa(id: number): void {
    this.empresaService.buscarEmpresa(id).subscribe(
      (empresa) => {
        this.empresaSelecionada = empresa;
        this.messageService.showError('Empresa encontrada!', 'Fechar');
      },
      (error) => {
        console.error('Erro ao consultar empresa:', error);
        this.messageService.showError('Empresa não encontrada.', 'Fechar');
      }
    );
  }

  toggleShowPassword(): void {
    this.hide = !this.hide;
  }

  aplicarMascaraCNPJ(event: any): void {
    const input = event.target;
    input.value = this.formattingService.maskCNPJ(input.value);
  }

  aplicarMascaraCEP(event: any): void {
    const input = event.target;
    input.value = this.formattingService.maskCEP(input.value);
  }

  onClear(): void {
    this.formData = {
      cnpj: '',
      razaoSocial: '',
      nomeFantasia: '',
      indicadorIE: '',
      regimeTributario: '',
      inscricaoEstadual: '',
      senha: '',
      idCnae: null,
      enderecoDTO: {
        cep: '',
        logradouro: '',
        numero: '',
        complemento: '',
        bairro: '',
        uf: '',
        municipio: '',
      },
      contatoDTO: {
        telefone: '',
        telefone2: '',
        email: '',
      },
    };
    this.messageService.showSuccess('Campos do formulário limpos!', 'Fechar');
  }

  onBack(): void {
    this.router.navigate(['/login-empresa']);
  }

  onCancel() {
    this.location.back();
  }

  //loads
  loadCNAEs(): void {
    this.cnaeService.listarCNAEs().subscribe(
      (cnaes) => {
        this.cnaes = cnaes;
      },
      (error) => {
        console.error('Erro ao carregar CNAEs:', error);
        this.messageService.showError('Erro ao carregar CNAEs. Tente novamente!', 'Fechar');
      }
    );
  }

  loadEmpresas(): void {
    this.empresaService.listarEmpresas().subscribe(
      (empresas) => {
        this.empresas = empresas;
      },
      (error) => {
        console.error('Erro ao carregar empresas:', error);
        this.messageService.showError('Erro ao carregar empresas.', 'Fechar');
      }
    );
  }
}
