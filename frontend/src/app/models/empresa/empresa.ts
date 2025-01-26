import { ContatoDTO } from "../contato/contato-dto";
import { EnderecoDTO } from "../endereco/endereco-dto";

export interface Empresa {
  cnpj: string;
  razaoSocial: string;
  nomeFantasia: string;
  indicadorIE: string;
  regimeTributario: string;
  inscricaoEstadual: string;
  senha: string;
  idCnae: number | null;
  enderecoDTO: EnderecoDTO;
  contatoDTO: ContatoDTO;
}
