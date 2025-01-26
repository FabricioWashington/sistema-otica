export interface EnderecoDTO {
  cep: string;
  logradouro: string;
  numero: string;
  complemento?: string;
  bairro: string;
  uf: string;
  municipio: string;
}
