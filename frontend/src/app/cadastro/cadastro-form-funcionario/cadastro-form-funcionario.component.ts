import { CargoFuncionarioService } from './../../services/cargofuncionario/cargo-funcionario.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CargoFuncionario } from '../../models/cargofuncionario/cargo-funcionario';

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
  cargos: CargoFuncionario[] = [];

  constructor(
    private router: Router,
    private cargoService: CargoFuncionarioService,
  ) { }

  ngOnInit(): void {
    this.loadCargos();
  }

  loadCargos(): void {
    this.cargoService.getAll().subscribe((data) => {
      this.cargos = data;
    });
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
}
