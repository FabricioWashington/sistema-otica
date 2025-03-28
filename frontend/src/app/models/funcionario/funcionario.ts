import { CargoFuncionario } from './../cargo-funcionario/cargo-funcionario';
export interface Funcionario {
  cpf: string;
  nomeCompleto: string;
  idFuncao: number;

  cargoFuncionario: CargoFuncionario;
}
