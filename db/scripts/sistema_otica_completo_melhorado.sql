

-- Script melhorado do banco de dados sistema_otica
-- Aplicadas boas práticas: snake_case, foreign keys explícitas, charset utf8mb4
SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;


-- Tabela agendamento_exame
CREATE TABLE agendamento_exame (
  id_agendamento int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cliente int UNSIGNED NOT NULL,
  data_exame date DEFAULT NULL,
  data_agendamento date DEFAULT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Agendamento`),
  UNIQUE KEY `id_Agendamento_UNIQUE` (`id_Agendamento`),
  KEY `fk_Agendamento_Exame_Clientes1_idx` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela armacoes
CREATE TABLE armacoes (
  id_armacoes int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  referencia varchar(255) DEFAULT NULL,
  id_oculos int UNSIGNED DEFAULT NULL,
  id_marca int UNSIGNED DEFAULT NULL,
  id_material int UNSIGNED DEFAULT NULL,
  quantid_ade int DEFAULT NULL,
  cor varchar(45) DEFAULT NULL,
  sexo_enum varchar(1) DEFAULT NULL,
  data_cadastro datetime NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Armacoes`),
  UNIQUE KEY `id_Armacoes_UNIQUE` (`id_Armacoes`),
  KEY `fk_Armacoes_Material_idx` (`id_Material`),
  KEY `fk_Armacoes_Oculos_idx` (`id_Oculos`),
  KEY `fk_Armacoes_Marca_idx` (`id_Marca`),
  KEY `fk_Armacoes_Produto_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela cadastro_funcionarios
CREATE TABLE cadastro_funcionarios (
  id_funcionario int UNSIGNED NOT NULL AUTO_INCREMENT,
  cpf varchar(14) NOT NULL,
  nome_completo varchar(100) NOT NULL,
  id_funcao int UNSIGNED DEFAULT NULL,
  data_cadastro datetime NOT NULL,
  data_modificacao datetime NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Funcionario`),
  UNIQUE KEY `id_Cadastro_Funcionarios_UNIQUE` (`id_Funcionario`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  KEY `fk_Funcionarios_cargo_funcionario1_idx` (`id_Funcao`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela caixa
CREATE TABLE caixa (
  id_caixa bigint NOT NULL AUTO_INCREMENT,
  data_abertura datetime NOT NULL,
  data_fechamento datetime DEFAULT NULL,
  saldo_inicial decimal(38,2) NOT NULL,
  operador varchar(255) NOT NULL,
  saldo_final decimal(38,2) DEFAULT NULL,
  status varchar(255) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_caixa`),
  KEY `fk_usuarios_empresa_idsx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela cargo_funcionario
CREATE TABLE cargo_funcionario (
  id_cargo_funcionario int UNSIGNED NOT NULL AUTO_INCREMENT,
  cargo varchar(255) NOT NULL,
  salario decimal(38,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Cargo_Funcionario`),
  UNIQUE KEY `id_Cargo_Funcionario_UNIQUE` (`id_Cargo_Funcionario`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela categoria
CREATE TABLE categoria (
  id_categoria int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_categoria varchar(255) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Categoria`),
  UNIQUE KEY `id_Categoria_UNIQUE` (`id_Categoria`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela cfop_estadual
CREATE TABLE cfop_estadual (
  id_cfop int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_cfop varchar(255) NOT NULL,
  PRIMARY KEY (`id_CFOP`),
  UNIQUE KEY `id_CFOP_UNIQUE` (`id_CFOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela clientes
CREATE TABLE clientes (
  id_clientes int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  data_cadastro datetime NOT NULL,
  data_modificacao datetime NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  logradouro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  bairro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  numero varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  complemento varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  cep varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  uf varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  municipio varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  email varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  telefone varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  telefone2 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  id_contato bigint NOT NULL,
  id_endereco bigint NOT NULL,
  PRIMARY KEY (`id_Clientes`),
  UNIQUE KEY `id_Clientes_UNIQUE` (`id_Clientes`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela cnae
CREATE TABLE cnae (
  id_cnae bigint NOT NULL,
  cnae_principal varchar(255) NOT NULL,
  PRIMARY KEY (`id_CNAE`),
  UNIQUE KEY `id_CNAE_UNIQUE` (`id_CNAE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela cnae_secundario
CREATE TABLE cnae_secundario (
  id_cnae_secundario int UNSIGNED NOT NULL,
  cnae_secundario varchar(45) NOT NULL,
  PRIMARY KEY (`id_CNAE_Secundario`),
  UNIQUE KEY `id_CNAE_Secundario_UNIQUE` (`id_CNAE_Secundario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela configuracoesnfe
CREATE TABLE configuracoesnfe (
  id_configuracao int NOT NULL AUTO_INCREMENT,
  chave varchar(50) NOT NULL,
  valor varchar(255) NOT NULL,
  descricao varchar(100) DEFAULT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_configuracao`,`id_Empresa`),
  UNIQUE KEY `chave` (`chave`),
  KEY `fk_configuracoesnfe_empresa1_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela confins_estadual
CREATE TABLE confins_estadual (
  id_confins int UNSIGNED NOT NULL AUTO_INCREMENT,
  aliquota decimal(10,2) DEFAULT NULL,
  id_csosn int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_CONFINS`),
  UNIQUE KEY `id_CONFINS_UNIQUE` (`id_CONFINS`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`),
  KEY `fk_CONFINS_Estadual_CSOSN_CONFINS1_idx` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela contato
CREATE TABLE contato (
  id_contato int NOT NULL AUTO_INCREMENT,
  email varchar(255) NOT NULL,
  telefone varchar(255) NOT NULL,
  telefone2 varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Contato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela csosn_confins
CREATE TABLE csosn_confins (
  id_csosn int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_CSOSN`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela csosn_icms
CREATE TABLE csosn_icms (
  id_csosn int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_CSOSN`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela csosn_ipi
CREATE TABLE csosn_ipi (
  id_csosn int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_CSOSN`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela csosn_pis
CREATE TABLE csosn_pis (
  id_csosn int NOT NULL,
  nome varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela empresa
CREATE TABLE empresa (
  id_empresa int UNSIGNED NOT NULL AUTO_INCREMENT,
  cnpj varchar(255) NOT NULL,
  razao_social varchar(255) NOT NULL,
  nome_fantasia varchar(255) DEFAULT NULL,
  regime_tributario varchar(255) DEFAULT NULL,
  inscricao_estadual varchar(255) DEFAULT NULL,
  indicador_ie varchar(255) DEFAULT NULL,
  data_cadastro datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_modificacao datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  senha varchar(255) NOT NULL,
  logradouro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  bairro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  numero varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  complemento varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  cep varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  uf varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  municipio varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  email varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  telefone varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  telefone2 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  id_cnae bigint DEFAULT NULL,
  id_contato int DEFAULT NULL,
  id_endereco int DEFAULT NULL,
  PRIMARY KEY (`id_Empresa`),
  UNIQUE KEY `id_Empresa_UNIQUE` (`id_Empresa`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela endereco
CREATE TABLE endereco (
  id_endereco int NOT NULL AUTO_INCREMENT,
  bairro varchar(255) NOT NULL,
  cep varchar(255) NOT NULL,
  complemento varchar(255) DEFAULT NULL,
  logradouro varchar(255) NOT NULL,
  municipio varchar(255) NOT NULL,
  numero varchar(255) NOT NULL,
  uf varchar(255) NOT NULL,
  PRIMARY KEY (`id_Endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela enquadramento_legal
CREATE TABLE enquadramento_legal (
  id_legal int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Legal`),
  UNIQUE KEY `id_Legal_UNIQUE` (`id_Legal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela estoque
CREATE TABLE estoque (
  id_produto int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_categoria int UNSIGNED DEFAULT NULL,
  descricao varchar(255) NOT NULL,
  quantid_ade int NOT NULL,
  preco_unitario decimal(10,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Produto`),
  UNIQUE KEY `id_estoque_UNIQUE` (`id_Produto`),
  KEY `fk_estoque_Categoria1_idx` (`id_Categoria`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela exame
CREATE TABLE exame (
  id_exame int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cliente int UNSIGNED NOT NULL,
  id_optometrista int UNSIGNED NOT NULL,
  data_exame date NOT NULL,
  tipo_exame varchar(100) NOT NULL,
  resultados text,
  observacoes text,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Exame`),
  UNIQUE KEY `id_Exame_UNIQUE` (`id_Exame`),
  KEY `fk_Exame_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_Exame_Clientes1_idx` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela icms_estadual
CREATE TABLE icms_estadual (
  id_icms int UNSIGNED NOT NULL AUTO_INCREMENT,
  aliquota decimal(10,2) DEFAULT NULL,
  credito decimal(10,2) DEFAULT NULL,
  icms_st_reducao varchar(45) DEFAULT NULL,
  id_csosn int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_ICMS`),
  UNIQUE KEY `id_ICMS_UNIQUE` (`id_ICMS`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`),
  KEY `fk_ICMS_Estadual_CSOSN1_idx` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela imposto
CREATE TABLE imposto (
  id_imposto int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  descricao varchar(45) NOT NULL,
  tipo varchar(45) NOT NULL,
  PRIMARY KEY (`id_Imposto`),
  UNIQUE KEY `id_Imposto_UNIQUE` (`id_Imposto`),
  KEY `fk_Imposto_Produto1_idx` (`id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela impostos_estadual
CREATE TABLE impostos_estadual (
  id_imposto int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cfop int UNSIGNED DEFAULT NULL,
  id_origem int UNSIGNED DEFAULT NULL,
  id_icms int UNSIGNED DEFAULT NULL,
  id_pis int UNSIGNED DEFAULT NULL,
  id_cofins int UNSIGNED DEFAULT NULL,
  id_ipi int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_Imposto`),
  UNIQUE KEY `id_UNIQUE` (`id_Imposto`),
  UNIQUE KEY `id_CFOP_UNIQUE` (`id_CFOP`),
  UNIQUE KEY `id_Origem_UNIQUE` (`id_Origem`),
  UNIQUE KEY `id_ICMS_UNIQUE` (`id_ICMS`),
  UNIQUE KEY `id_PIS_UNIQUE` (`id_PIS`),
  UNIQUE KEY `id_COFINS_UNIQUE` (`id_COFINS`),
  UNIQUE KEY `id_IPI_UNIQUE` (`id_IPI`),
  KEY `fk_Impostos_Estadual_CFOP1_idx` (`id_CFOP`),
  KEY `fk_Impostos_Estadual_Origem_Estadual1_idx` (`id_Origem`),
  KEY `fk_Impostos_Estadual_ICMS_Estadual1_idx` (`id_ICMS`),
  KEY `fk_Impostos_Estadual_PIS_Estadual1_idx` (`id_PIS`),
  KEY `fk_Impostos_Estadual_CONFINS_Estadual1_idx` (`id_COFINS`),
  KEY `fk_Impostos_Estadual_IPI_Estadual1_idx` (`id_IPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela ipi_estadual
CREATE TABLE ipi_estadual (
  id_ipi int UNSIGNED NOT NULL AUTO_INCREMENT,
  aliquota decimal(10,2) DEFAULT NULL,
  id_csosn int UNSIGNED DEFAULT NULL,
  id_legal int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id_IPI`),
  UNIQUE KEY `id_IPI_UNIQUE` (`id_IPI`),
  UNIQUE KEY `id_Legal_UNIQUE` (`id_Legal`),
  UNIQUE KEY `id_CSOSN_UNIQUE` (`id_CSOSN`),
  KEY `fk_IPI_Estadual_CSOSN_IPI1_idx` (`id_CSOSN`),
  KEY `fk_IPI_Estadual_Enquadramento_Legal1_idx` (`id_Legal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela lentes
CREATE TABLE lentes (
  id_lentes int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  id_tipo_lente int UNSIGNED NOT NULL,
  id_material int UNSIGNED NOT NULL,
  id_tratamento int UNSIGNED NOT NULL,
  indice_refracao decimal(5,2) NOT NULL,
  preco_custo decimal(10,2) NOT NULL,
  preco_venda decimal(10,2) NOT NULL,
  quantid_ade int NOT NULL,
  grau decimal(4,2) NOT NULL,
  eixo int DEFAULT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_lentes`),
  UNIQUE KEY `id_lentes_UNIQUE` (`id_lentes`),
  KEY `fk_lentes_Tratamento1_idx` (`id_Tratamento`),
  KEY `fk_lentes_Material_Lente1_idx` (`id_Material`),
  KEY `fk_lentes_tipo_lente1_idx` (`id_Tipo_Lente`),
  KEY `fk_lentes_Produto1_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela lentes_contato
CREATE TABLE lentes_contato (
  id_lentes int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  id_tipo_lente int UNSIGNED NOT NULL,
  id_material int UNSIGNED NOT NULL,
  id_tratamento int UNSIGNED NOT NULL,
  curva_base decimal(5,2) NOT NULL,
  diametro decimal(5,2) NOT NULL,
  preco_custo decimal(10,2) NOT NULL,
  preco_venda decimal(10,2) NOT NULL,
  quantid_ade int NOT NULL,
  grau decimal(4,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_lentes`),
  UNIQUE KEY `id_lentes_UNIQUE` (`id_lentes`),
  KEY `fk_lentes_Tratamento1_idx` (`id_Tratamento`),
  KEY `fk_lentes_Material_Lente1_idx` (`id_Material`),
  KEY `fk_lentes_tipo_lente1_idx` (`id_Tipo_Lente`),
  KEY `fk_lentes_contato_Produto1_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela usuarios
CREATE TABLE usuarios (
  id_usuario bigint NOT NULL AUTO_INCREMENT,
  login_usuario varchar(255) NOT NULL,
  login_senha varchar(255) NOT NULL,
  id_tipos_login int UNSIGNED NOT NULL,
  data_cadastro datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  data_modificacao datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_empresa int UNSIGNED NOT NULL,
  cpf varchar(255) DEFAULT NULL,
  nome_completo varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `Login_Usuario_UNIQUE` (`login_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  UNIQUE KEY `UKkbqarh41retb8hm7ue4yaosrh` (`cpf`),
  KEY `fk_login_tipos_login1_idx` (`id_tipos_login`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela marca
CREATE TABLE marca (
  id_marca int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_marca varchar(45) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Marca`),
  UNIQUE KEY `id_Marca_UNIQUE` (`id_Marca`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela material
CREATE TABLE material (
  id_material int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_material varchar(45) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Material`),
  UNIQUE KEY `id_Material_UNIQUE` (`id_Material`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela material_lente
CREATE TABLE material_lente (
  id_material_lente int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_Material_Lente`),
  UNIQUE KEY `id_Material_Lente_UNIQUE` (`id_Material_Lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela material_lente_contato
CREATE TABLE material_lente_contato (
  id_material_lente int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_Material_Lente`),
  UNIQUE KEY `id_Material_Lente_UNIQUE` (`id_Material_Lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela movimentacoes
CREATE TABLE movimentacoes (
  id_movimentacoes int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  id_venda int DEFAULT NULL,
  tipo_movimento enum('Entrada','Said_a') NOT NULL,
  quantid_ade int NOT NULL,
  data_movimento date NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_movimentacoes`),
  UNIQUE KEY `id_movimentacoes_UNIQUE` (`id_movimentacoes`),
  KEY `fk_movimentacoes_Produto1_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela movimentacoes_caixa
CREATE TABLE movimentacoes_caixa (
  id_movimentacao int NOT NULL AUTO_INCREMENT,
  id_caixa int NOT NULL,
  data_movimentacao datetime NOT NULL,
  tipo enum('entrada','said_a') NOT NULL,
  valor decimal(10,2) NOT NULL,
  id_venda int NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `id_caixa` (`id_caixa`),
  KEY `id_Venda` (`id_Venda`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela nota_detalhe
CREATE TABLE nota_item (
  id_nota int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  quantid_ade int NOT NULL,
  valor_unitario decimal(10,2) NOT NULL,
  valor_total decimal(10,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_nota`),
  UNIQUE KEY `id_nota_detalhe_UNIQUE` (`id_nota`),
  KEY `fk_nota_detalhe_Produto1_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela nota_fiscal
CREATE TABLE nota_fiscal (
  id_nota int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_venda int UNSIGNED NOT NULL,
  id_cliente int UNSIGNED NOT NULL,
  numero_nota varchar(255) NOT NULL,
  data_emissao date NOT NULL,
  valor_total decimal(10,2) NOT NULL,
  observacoes text,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_nota`),
  UNIQUE KEY `id_nota_UNIQUE` (`id_nota`),
  KEY `fk_nota_fiscal_Clientes1_idx` (`id_Cliente`),
  KEY `fk_nota_fiscal_Venda1_idx` (`id_Venda`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela oculos
CREATE TABLE oculos (
  id_oculos int UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo varchar(45) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Oculos`),
  UNIQUE KEY `id_Oculos_UNIQUE` (`id_Oculos`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela optometrista
CREATE TABLE optometrista (
  id_optometrista int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  registro_profissional varchar(255) NOT NULL,
  data_cadastro datetime(6) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  logradouro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  bairro varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  numero varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  complemento varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  cep varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  uf varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  municipio varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  email varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  telefone varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  contato varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  id_contato bigint NOT NULL,
  id_endereco bigint NOT NULL,
  PRIMARY KEY (`id_Optometrista`),
  UNIQUE KEY `id_Medico_UNIQUE` (`id_Optometrista`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela ordem_servico
CREATE TABLE ordem_servico (
  id_ordem int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cliente int UNSIGNED NOT NULL,
  id_optometrista int UNSIGNED NOT NULL,
  id_funcionario int UNSIGNED NOT NULL,
  id_receita int UNSIGNED NOT NULL,
  id_produto int UNSIGNED NOT NULL,
  data_emissao datetime DEFAULT NULL,
  data_entrega datetime DEFAULT NULL,
  tipo_servico varchar(100) NOT NULL,
  status_servico varchar(50) NOT NULL,
  valor decimal(10,2) NOT NULL,
  vl_entrada decimal(10,2) DEFAULT NULL,
  vl_restante decimal(10,2) DEFAULT NULL,
  observacoes text,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ordem`),
  UNIQUE KEY `id_ordem_UNIQUE` (`id_ordem`),
  KEY `fk_ordem_servico_Clientes1_idx` (`id_Cliente`),
  KEY `fk_ordem_servico_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_ordem_servico_Receita_Exame1_idx` (`id_Receita`),
  KEY `fk_ordem_servico_Produto1_idx` (`id_Produto`),
  KEY `fk_ordem_servico_Funcionarios1_idx` (`id_Funcionario`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela origem_estadual
CREATE TABLE origem_estadual (
  id_origem int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Origem`),
  UNIQUE KEY `id_Origem_UNIQUE` (`id_Origem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela pedido_detalhe
CREATE TABLE pedido_detalhe (
  id_pedido_registro int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  descricao varchar(45) DEFAULT NULL,
  qntde int DEFAULT NULL,
  vlrunitario decimal(10,2) DEFAULT NULL,
  vlrtotal decimal(10,2) DEFAULT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Pedido_Registro`),
  UNIQUE KEY `id_Pedid_o_UNIQUE` (`id_Pedido_Registro`),
  KEY `fk_Pedid_o_detalhe_Produto1_idx` (`id_Produto`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela pedido_registro
CREATE TABLE pedido_registro (
  id_pedido_registro int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cliente_fisico int NOT NULL,
  id_funcionario int UNSIGNED NOT NULL,
  data datetime NOT NULL,
  vlr decimal(10,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Pedido_Registro`),
  UNIQUE KEY `id_Pedido_Registro_UNIQUE` (`id_Pedido_Registro`),
  KEY `fk_Pedid_o_Registro_Funcionarios1_idx` (`id_Funcionario`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela pessoa_fisica
CREATE TABLE pessoa_fisica (
  id_ bigint NOT NULL AUTO_INCREMENT,
  cpf varchar(255) NOT NULL,
  id_cliente int UNSIGNED NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_`),
  KEY `fk_PessoaFisica_Clientes` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela pessoajurid_ica
CREATE TABLE pessoa_juridica (
  id_ bigint NOT NULL AUTO_INCREMENT,
  nome_fantasia varchar(255) NOT NULL,
  cnpj varchar(255) NOT NULL,
  inscricao_estadual varchar(255) NOT NULL,
  inscricao_municipal varchar(25) NOT NULL,
  id_cliente int UNSIGNED NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  inscricaomunicipal varchar(255) NOT NULL,
  PRIMARY KEY (`id_`),
  KEY `fk_PessoaJurid_ica_Clientes` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela pis_estadual
CREATE TABLE pis_estadual (
  id_pis int UNSIGNED NOT NULL AUTO_INCREMENT,
  aliquota decimal(10,2) DEFAULT NULL,
  id_csosn int DEFAULT NULL,
  PRIMARY KEY (`id_PIS`),
  UNIQUE KEY `id_PIS_UNIQUE` (`id_PIS`),
  KEY `fk_PIS_Estadual_CSOSN_PIS1_idx` (`id_CSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela produto
CREATE TABLE produto (
  id_produto int UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_produto varchar(100) NOT NULL,
  unidade varchar(255) NOT NULL,
  id_categoria int UNSIGNED NOT NULL,
  preco decimal(10,2) UNSIGNED NOT NULL,
  data date DEFAULT NULL,
  imagem varchar(255) DEFAULT NULL,
  codigo_de_barras varchar(50) NOT NULL,
  observacoes text,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Produto`),
  UNIQUE KEY `id_Produto_UNIQUE` (`id_Produto`),
  UNIQUE KEY `Codigo_de_Barras_UNIQUE` (`Codigo_de_Barras`),
  KEY `fk_Produto_Categoria1_idx` (`id_Categoria`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela receita_exame
CREATE TABLE receita_exame (
  id_receita int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_exame int UNSIGNED NOT NULL,
  id_optometrista int UNSIGNED NOT NULL,
  id_cliente int UNSIGNED NOT NULL,
  data_receita date NOT NULL,
  esfera_direito varchar(10) DEFAULT NULL,
  cilindro_direito varchar(10) DEFAULT NULL,
  eixo_direito varchar(10) DEFAULT NULL,
  dip_direito varchar(10) DEFAULT NULL,
  dnp_direito varchar(10) DEFAULT NULL,
  adicao_direito varchar(10) DEFAULT NULL,
  esfera_esquerdo varchar(10) DEFAULT NULL,
  cilindro_esquerdo varchar(10) DEFAULT NULL,
  eixo_esquerdo varchar(10) DEFAULT NULL,
  dip_esquerdo varchar(10) DEFAULT NULL,
  dnp_esquerdo varchar(10) DEFAULT NULL,
  adicao_esquerdo varchar(10) DEFAULT NULL,
  observacoes text,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Receita`),
  UNIQUE KEY `id_Receita_UNIQUE` (`id_Receita`),
  KEY `fk_Receita_Exame_Exame1_idx` (`id_Exame`),
  KEY `fk_Receita_Exame_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_Receita_Exame_Clientes1_idx` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela situacao
CREATE TABLE situacao (
  id_situacao int NOT NULL AUTO_INCREMENT,
  descricao varchar(100) NOT NULL,
  PRIMARY KEY (`id_Situacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela tipos_login
CREATE TABLE tipos_login (
  id_tipos_login int UNSIGNED NOT NULL AUTO_INCREMENT,
  tipos_login varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipos_login`),
  UNIQUE KEY `id_tipos_login_UNIQUE` (`id_tipos_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela tipo_lente
CREATE TABLE tipo_lente (
  id_tipo_lente int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_lente`),
  UNIQUE KEY `id_tipo_lente_UNIQUE` (`id_tipo_lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela tipo_lente_contato
CREATE TABLE tipo_lente_contato (
  id_tipo_lente int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_lente`),
  UNIQUE KEY `id_tipo_lente_UNIQUE` (`id_tipo_lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela tipo_pagamento
CREATE TABLE tipo_pagamento (
  id_pagamento int NOT NULL AUTO_INCREMENT,
  tipo_pagamento varchar(45) NOT NULL,
  PRIMARY KEY (`id_Pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabela tratamento
CREATE TABLE tratamento (
  id_tratamento int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_Tratamento`),
  UNIQUE KEY `id_Tratamento_UNIQUE` (`id_Tratamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela tratamento_contato
CREATE TABLE tratamento_contato (
  id_tratamento int UNSIGNED NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_Tratamento`),
  UNIQUE KEY `id_Tratamento_UNIQUE` (`id_Tratamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela unidade
CREATE TABLE unidade (
  id_ bigint NOT NULL AUTO_INCREMENT,
  descricao varchar(255) NOT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `id_UNIQUE` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela venda
CREATE TABLE venda (
  id_venda int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_funcionario int UNSIGNED NOT NULL,
  id_cliente bigint NOT NULL,
  id_pagamento int NOT NULL,
  data date NOT NULL,
  vl_sugerido decimal(10,2) NOT NULL,
  desconto decimal(10,2) NOT NULL DEFAULT '0.00',
  totalvenda decimal(10,2) NOT NULL,
  parcela varchar(255) DEFAULT NULL,
  vencimento date DEFAULT NULL,
  status varchar(255) DEFAULT NULL,
  recebeu decimal(10,2) DEFAULT NULL,
  restante decimal(10,2) DEFAULT NULL,
  vl_final decimal(10,2) NOT NULL,
  id_caixa int NOT NULL,
  vl_recebid_o decimal(10,2) DEFAULT NULL,
  vl_restante decimal(10,2) DEFAULT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Venda`),
  UNIQUE KEY `id_Venda_UNIQUE` (`id_Venda`),
  UNIQUE KEY `id_Funcionario_UNIQUE` (`id_Funcionario`),
  UNIQUE KEY `id_Cliente_UNIQUE` (`id_Cliente`),
  KEY `fk_Venda_Tipo_Pagamento1_idx` (`id_Pagamento`),
  KEY `fk_Venda_Clientes1_idx` (`id_Cliente`),
  KEY `fk_Venda_cadastro_funcionarios1_idx` (`id_Funcionario`),
  KEY `fk_venda_caixa1_idx` (`id_Caixa`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela venda_itens
CREATE TABLE venda_itens (
  id_venda int UNSIGNED NOT NULL AUTO_INCREMENT,
  id_produto int UNSIGNED NOT NULL,
  quantidade int UNSIGNED NOT NULL,
  desconto decimal(10,2) NOT NULL DEFAULT '0.00',
  preco decimal(10,2) UNSIGNED NOT NULL,
  vl_total decimal(10,2) NOT NULL,
  id_empresa int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Venda`),
  KEY `fk_Venda_Itens_Produto1_idx` (`id_Produto`),
  KEY `fk_Venda_Itens_Venda1_idx` (`id_Venda`),
  KEY `fk_usuarios_empresa_idx` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela venda_produto
CREATE TABLE venda_produto (
  id_venda_produto int NOT NULL AUTO_INCREMENT,
  id_venda int NOT NULL,
  id_produto int NOT NULL,
  id_estoque int NOT NULL,
  id_empresa int NOT NULL,
  vl_preco decimal(10,2) NOT NULL,
  vl_custo decimal(10,2) NOT NULL,
  data_alteracao timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  data_criacao timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Venda_Produto`),
  KEY `fk_venda_produto_venda` (`id_Venda`),
  KEY `fk_venda_produto_produto` (`id_Produto`),
  KEY `fk_venda_produto_estoque` (`id_Estoque`),
  KEY `fk_venda_produto_empresa` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabela venda_produto_estorno
CREATE TABLE venda_produto_estorno (
  id_venda_produto_estorno int NOT NULL AUTO_INCREMENT,
  id_venda int NOT NULL,
  id_produto int NOT NULL,
  id_estoque int NOT NULL,
  id_empresa int NOT NULL,
  vl_preco decimal(10,2) NOT NULL,
  vl_custo decimal(10,2) NOT NULL,
  qtd int NOT NULL,
  nomeproduto varchar(100) NOT NULL,
  data_alteracao timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  data_criacao timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_Venda_Produto_Estorno`),
  KEY `fk_venda_produto_estorno_venda` (`id_Venda`),
  KEY `fk_venda_produto_estorno_produto` (`id_Produto`),
  KEY `fk_venda_produto_estorno_estoque` (`id_Estoque`),
  KEY `fk_venda_produto_estorno_empresa` (`id_Empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SET foreign_key_checks = 1;