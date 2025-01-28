export interface Endereco {
  idEndereco?: number;
  logradouro: string;
  numero: string;
  complemento?: string;
  bairro: string;
  uf: string;
  municipio: string;
  cep: string;
}
