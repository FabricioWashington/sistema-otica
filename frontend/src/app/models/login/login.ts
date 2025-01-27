export interface Login {
  idlogin: number;
  loginUsuario: string;
  loginSenha: string;
  tiposLogin: { id: number; tiposLogin: string };
  idUsuario: number;
  dataCadastro: Date;
  dataModificacao: Date;
  idEmpresa: number;
}
