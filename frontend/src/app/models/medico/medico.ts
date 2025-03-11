import { Endereco } from './../endereco/endereco';
import { Contato } from './../contato/contato';
export interface Medico {
  id?: number;
  nome: string;
  registroProfissional: string;
  dataCadastro?: Date;
  logradouro: string;
  bairro: string;
  numero?: string;
  cep: number;
  uf: string;
  municipio: string;
  complemento?: string;
  email: string;
  telefone: number;
  telefone2?: number;


}
