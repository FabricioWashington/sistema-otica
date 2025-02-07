export interface Caixa {
  id?: number;
  dataAbertura: string;
  dataFechamento?: string;
  saldoInicial: number;
  saldoFinal?: number;
  status: string;
  operador: string;
}
