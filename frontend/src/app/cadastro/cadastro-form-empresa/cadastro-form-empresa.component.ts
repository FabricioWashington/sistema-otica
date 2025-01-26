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
    private cnaeService: CnaeService,
  ) { }

  ngOnInit(): void {
    this.loadEmpresas();
    this.loadCNAEs();
  }


  onSubmit(): void {
    // if (!this.validationService.validateCNPJ(this.formData.cnpj)) {
    //   this.onError('CNPJ inválido!', 'Fechar', { duration: 3000 });
    //   return;
    // }
    console.log('Dados enviados:', this.formData);
    this.empresaService.cadastrarEmpresa(this.formData).subscribe(
      () => {
        this._snackBar.open('Cadastro realizado com sucesso!', 'Fechar', { duration: 3000 });
        this.router.navigate(['/login-empresa']);
      },
      (error) => {
        console.error('Erro ao cadastrar a empresa:', error);
        console.log('Detalhes do erro:', error.error);
        this._snackBar.open('Erro ao cadastrar a empresa. Tente novamente!', 'Fechar', { duration: 3000 });
      }
    );
  }

  consultarEmpresa(idOuCnpj: string): void {
    this.empresaService.buscarEmpresa(idOuCnpj).subscribe(
      (empresa) => {
        this.empresaSelecionada = empresa;
        this._snackBar.open('Empresa encontrada!', 'Fechar', { duration: 3000 });
      },
      (error) => {
        console.error('Erro ao consultar empresa:', error);
        this._snackBar.open('Empresa não encontrada.', 'Fechar', { duration: 3000 });
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
    this._snackBar.open('Campos do formulário limpos!', 'Fechar', { duration: 2000 });
  }

  onBack(): void {
    this.router.navigate(['/login-empresa']);
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
  //loads
  loadCNAEs(): void {
    this.cnaeService.listarCNAEs().subscribe(
      (cnaes) => {
        this.cnaes = cnaes;
      },
      (error) => {
        console.error('Erro ao carregar CNAEs:', error);
        this._snackBar.open('Erro ao carregar CNAEs. Tente novamente!', 'Fechar', { duration: 3000 });
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
        this._snackBar.open('Erro ao carregar empresas.', 'Fechar', { duration: 3000 });
      }
    );
  }
}
