import { Categoria } from "../categoria/categoria";

export interface Produto {
  idProduto: number;
  nomeProduto: string;
  unidade: string;
  categorias: Categoria[];
  preco: number;
  imagem: string;
  codigoDeBarras: string;
  observacoes: string;
  quantidade: number;
  valorTotal: number;
}
