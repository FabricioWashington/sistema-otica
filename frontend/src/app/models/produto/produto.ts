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
  item: number;
  codigo: string;
  produto: string;
  quantidade: number;
  valorUnitario: number;
  valorTotal: number;
}
