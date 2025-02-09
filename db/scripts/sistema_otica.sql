-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 09/02/2025 às 15:02
-- Versão do servidor: 8.2.0
-- Versão do PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_otica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento_exame`
--

DROP TABLE IF EXISTS `agendamento_exame`;
CREATE TABLE IF NOT EXISTS `agendamento_exame` (
  `idAgendamento` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCliente` int UNSIGNED NOT NULL,
  `Data_Exame` date DEFAULT NULL,
  `Data_Agendamento` date DEFAULT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idAgendamento`),
  UNIQUE KEY `idAgendamento_UNIQUE` (`idAgendamento`),
  KEY `fk_Agendamento_Exame_Clientes1_idx` (`idCliente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `armacoes`
--

DROP TABLE IF EXISTS `armacoes`;
CREATE TABLE IF NOT EXISTS `armacoes` (
  `idArmacoes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `Referencia` varchar(255) DEFAULT NULL,
  `idOculos` int UNSIGNED DEFAULT NULL,
  `idMarca` int UNSIGNED DEFAULT NULL,
  `idMaterial` int UNSIGNED DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `Cor` varchar(45) DEFAULT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `Data_Cadastro` datetime NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idArmacoes`),
  UNIQUE KEY `idArmacoes_UNIQUE` (`idArmacoes`),
  KEY `fk_Armacoes_Material1_idx` (`idMaterial`),
  KEY `fk_Armacoes_Oculos1_idx` (`idOculos`),
  KEY `fk_Armacoes_Marca1_idx` (`idMarca`),
  KEY `fk_Armacoes_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro_funcionarios`
--

DROP TABLE IF EXISTS `cadastro_funcionarios`;
CREATE TABLE IF NOT EXISTS `cadastro_funcionarios` (
  `idFuncionario` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CPF` varchar(14) NOT NULL,
  `Nome_Completo` varchar(100) NOT NULL,
  `idFuncao` int UNSIGNED DEFAULT NULL,
  `Data_Cadastro` datetime NOT NULL,
  `Data_Modificacao` datetime NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `idCadastro_Funcionarios_UNIQUE` (`idFuncionario`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  KEY `fk_Funcionarios_cargo_funcionario1_idx` (`idFuncao`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cadastro_funcionarios`
--

INSERT INTO `cadastro_funcionarios` (`idFuncionario`, `CPF`, `Nome_Completo`, `idFuncao`, `Data_Cadastro`, `Data_Modificacao`, `idEmpresa`) VALUES
(5, '210.635.000-79', 'Fabricio', 1, '2024-10-23 21:38:18', '2024-10-23 21:38:18', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixa`
--

DROP TABLE IF EXISTS `caixa`;
CREATE TABLE IF NOT EXISTS `caixa` (
  `id_caixa` bigint NOT NULL AUTO_INCREMENT,
  `data_abertura` datetime NOT NULL,
  `data_fechamento` datetime DEFAULT NULL,
  `saldo_inicial` decimal(38,2) NOT NULL,
  `operador` varchar(255) NOT NULL,
  `saldo_final` decimal(38,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_caixa`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `caixa`
--

INSERT INTO `caixa` (`id_caixa`, `data_abertura`, `data_fechamento`, `saldo_inicial`, `operador`, `saldo_final`, `status`, `idEmpresa`) VALUES
(1, '2025-02-06 23:29:37', '2025-02-07 00:17:21', 200.00, 'Teste', 100.00, 'fechado', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargo_funcionario`
--

DROP TABLE IF EXISTS `cargo_funcionario`;
CREATE TABLE IF NOT EXISTS `cargo_funcionario` (
  `idCargo_Funcionario` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(255) NOT NULL,
  `salario` decimal(38,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idCargo_Funcionario`),
  UNIQUE KEY `idCargo_Funcionario_UNIQUE` (`idCargo_Funcionario`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cargo_funcionario`
--

INSERT INTO `cargo_funcionario` (`idCargo_Funcionario`, `Cargo`, `salario`, `idEmpresa`) VALUES
(1, 'Vendedor', 1412.00, 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(255) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `idCategoria_UNIQUE` (`idCategoria`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nome_categoria`, `idEmpresa`) VALUES
(1, 'Óculos de Grau - Armações', 28),
(2, 'Óculos de Grau - Lentes Oftálmicas', 28),
(3, 'Óculos de Grau - Lentes Multifocais', 28),
(4, 'Óculos de Grau - Lentes Bifocais', 28),
(5, 'Óculos de Grau - Lentes Monofocais', 28),
(6, 'Óculos de Sol - Feminino', 28),
(7, 'Óculos de Sol - Masculino', 28),
(8, 'Óculos de Sol - Infantil', 28),
(9, 'Óculos de Sol - Polarizado', 28),
(10, 'Lentes de Contato - Diárias', 28),
(11, 'Lentes de Contato - Mensais', 28),
(12, 'Lentes de Contato - Coloridas', 28),
(13, 'Lentes de Contato - Tóricas', 28),
(14, 'Lentes de Contato - Multifocais', 28),
(15, 'Acessórios para Óculos - Caixas de Óculos', 28),
(16, 'Acessórios para Óculos - Cordões e Correntes', 28),
(17, 'Acessórios para Óculos - Panos de Limpeza', 28),
(18, 'Acessórios para Óculos - Produtos Antiembaçantes', 28),
(19, 'Acessórios para Óculos - Soluções de Limpeza', 28),
(20, 'Acessórios para Lentes de Contato - Estojos', 28),
(21, 'Acessórios para Lentes de Contato - Soluções', 28),
(22, 'Acessórios para Lentes de Contato - Colírios Hidratantes', 28),
(23, 'Acessórios para Lentes de Contato - Pinças', 28),
(24, 'Equipamentos de Medição - Pupílmetros', 28),
(25, 'Equipamentos de Medição - Régua DNP', 28),
(26, 'Equipamentos de Medição - Lensômetro', 28),
(27, 'Serviços - Ajuste e Reparos de Armações', 28),
(28, 'Serviços - Troca de Lentes', 28),
(29, 'Serviços - Consulta Oftalmológica', 28),
(30, 'Lentes Especiais - Lentes Transitions', 28),
(31, 'Lentes Especiais - Lentes com Filtro Azul', 28),
(32, 'Lentes Especiais - Lentes Polarizadas', 28),
(33, 'Lentes Especiais - Lentes de Proteção UV', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cfop_estadual`
--

DROP TABLE IF EXISTS `cfop_estadual`;
CREATE TABLE IF NOT EXISTS `cfop_estadual` (
  `idCFOP` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome_CFOP` varchar(255) NOT NULL,
  PRIMARY KEY (`idCFOP`),
  UNIQUE KEY `idCFOP_UNIQUE` (`idCFOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idClientes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `idEndereco` int UNSIGNED NOT NULL,
  `idContato` int UNSIGNED NOT NULL,
  `Data_Cadastro` datetime NOT NULL,
  `Data_Modificacao` datetime NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE KEY `idClientes_UNIQUE` (`idClientes`),
  UNIQUE KEY `idContato_UNIQUE` (`idContato`),
  UNIQUE KEY `idEndereco_UNIQUE` (`idEndereco`),
  KEY `fk_Clientes_endereco1_idx` (`idEndereco`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idClientes`, `nome`, `idEndereco`, `idContato`, `Data_Cadastro`, `Data_Modificacao`, `idEmpresa`) VALUES
(27, 'Silvana Sara da Paz', 76, 87, '2025-01-28 01:26:34', '2025-01-28 01:26:34', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cnae`
--

DROP TABLE IF EXISTS `cnae`;
CREATE TABLE IF NOT EXISTS `cnae` (
  `idCNAE` bigint NOT NULL,
  `CNAE_Principal` varchar(255) NOT NULL,
  PRIMARY KEY (`idCNAE`),
  UNIQUE KEY `idCNAE_UNIQUE` (`idCNAE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cnae`
--

INSERT INTO `cnae` (`idCNAE`, `CNAE_Principal`) VALUES
(111301, 'Cultivo de arroz'),
(111302, 'Cultivo de milho'),
(111303, 'Cultivo de trigo'),
(111399, 'Cultivo de outros cereais não especificados anteriormente'),
(112101, 'Cultivo de algodão herbáceo'),
(112102, 'Cultivo de juta'),
(112199, 'Cultivo de outras fibras de lavoura temporária não especificadas anteriormente'),
(113000, 'Cultivo de cana-de-açúcar'),
(114800, 'Cultivo de fumo'),
(115600, 'Cultivo de soja'),
(116401, 'Cultivo de amendoim'),
(116402, 'Cultivo de girassol'),
(116403, 'Cultivo de mamona'),
(116499, 'Cultivo de outras oleaginosas de lavoura temporária não especificadas anteriormente'),
(119901, 'Cultivo de abacaxi'),
(119902, 'Cultivo de alho'),
(119903, 'Cultivo de batata-inglesa'),
(119904, 'Cultivo de cebola'),
(119905, 'Cultivo de feijão'),
(119906, 'Cultivo de mandioca'),
(119907, 'Cultivo de melão'),
(119908, 'Cultivo de melancia'),
(119909, 'Cultivo de tomate rasteiro'),
(119999, 'Cultivo de outras plantas de lavoura temporária não especificadas anteriormente'),
(121101, 'Horticultura'),
(121102, 'Cultivo de morango'),
(122900, 'Cultivo de flores e plantas ornamentais'),
(131800, 'Cultivo de laranja'),
(132600, 'Cultivo de uva'),
(133401, 'Cultivo de açaí'),
(133402, 'Cultivo de banana'),
(133403, 'Cultivo de caju'),
(133404, 'Cultivo de cítricos'),
(133405, 'Cultivo de coco-da-baía'),
(133406, 'Cultivo de guaraná'),
(133407, 'Cultivo de maçã'),
(133408, 'Cultivo de mamão'),
(133409, 'Cultivo de maracujá'),
(133410, 'Cultivo de manga'),
(133411, 'Cultivo de pêssego'),
(133499, 'Cultivo de frutas de lavoura permanente não especificadas anteriormente'),
(134200, 'Cultivo de café'),
(135100, 'Cultivo de cacau'),
(139301, 'Cultivo de chá-da-índia'),
(139302, 'Cultivo de erva-mate'),
(139303, 'Cultivo de pimenta-do-reino'),
(139304, 'Cultivo de plantas para condimento'),
(139305, 'Cultivo de dendê'),
(139306, 'Cultivo de seringueira'),
(139399, 'Cultivo de outras plantas de lavoura permanente não especificadas anteriormente'),
(141501, 'Produção de sementes certificadas'),
(141502, 'Produção de sementes certificadas de forrageiras para formação de pasto'),
(142300, 'Produção de mudas e outras formas de propagação vegetal'),
(151201, 'Criação de bovinos para corte'),
(151202, 'Criação de bovinos para leite'),
(151203, 'Criação de bovinos'),
(152101, 'Criação de bufalinos'),
(152102, 'Criação de equinos'),
(152103, 'Criação de asininos e muares'),
(153901, 'Criação de caprinos'),
(153902, 'Criação de ovinos'),
(154700, 'Criação de suínos'),
(155501, 'Criação de frangos para corte'),
(155502, 'Produção de pintos de um dia'),
(155503, 'Criação de outros galináceos'),
(155504, 'Criação de aves'),
(155505, 'Produção de ovos'),
(159801, 'Apicultura'),
(159802, 'Criação de animais de estimação'),
(159803, 'Criação de escargô'),
(159804, 'Criação de bicho-da-seda'),
(159899, 'Criação de outros animais não especificados anteriormente'),
(161001, 'Serviço de pulverização e controle de pragas agrícolas'),
(161002, 'Serviço de poda de árvores para lavouras'),
(161003, 'Serviço de preparação de terreno'),
(161099, 'Atividades de apoio à agricultura não especificadas anteriormente'),
(162801, 'Serviço de inseminação artificial em animais'),
(162802, 'Serviço de tosquiamento de ovinos'),
(162803, 'Serviço de manejo de animais'),
(162899, 'Atividades de apoio à pecuária não especificadas anteriormente'),
(163600, 'Atividades de pós-colheita'),
(170900, 'Caça e serviços relacionados'),
(210101, 'Cultivo de eucalipto'),
(210102, 'Cultivo de acácia-negra'),
(210103, 'Cultivo de pinus'),
(210104, 'Cultivo de teca'),
(210105, 'Cultivo de espécies madeireiras'),
(210106, 'Cultivo de mudas em viveiros florestais'),
(210107, 'Extração de madeira em florestas plantadas'),
(210108, 'Produção de carvão vegetal - florestas plantadas'),
(210109, 'Produção de casca de acácia-negra - florestas plantadas'),
(210199, 'Produção de produtos não madeireiros não especificados anteriormente em florestas plantadas'),
(220901, 'Extração de madeira em florestas nativas'),
(220902, 'Produção de carvão vegetal - florestas nativas'),
(220903, 'Coleta de castanha-do-pará em florestas nativas'),
(220904, 'Coleta de látex em florestas nativas'),
(220905, 'Coleta de palmito em florestas nativas'),
(220906, 'Conservação de florestas nativas'),
(220999, 'Coleta de produtos não madeireiros não especificados anteriormente em florestas nativas'),
(230600, 'Atividades de apoio à produção florestal'),
(311601, 'Pesca de peixes em água salgada'),
(311602, 'Pesca de crustáceos e moluscos em água salgada'),
(311603, 'Coleta de outros produtos marinhos'),
(311604, 'Atividades de apoio à pesca em água salgada'),
(312401, 'Pesca de peixes em água doce'),
(312402, 'Pesca de crustáceos e moluscos em água doce'),
(312403, 'Coleta de outros produtos aquáticos de água doce'),
(312404, 'Atividades de apoio à pesca em água doce'),
(321301, 'Criação de peixes em água salgada e salobra'),
(321302, 'Criação de camarões em água salgada e salobra'),
(321303, 'Criação de ostras e mexilhões em água salgada e salobra'),
(321304, 'Criação de peixes ornamentais em água salgada e salobra'),
(321305, 'Atividades de apoio à aquicultura em água salgada e salobra'),
(321399, 'Cultivos e semicultivos da aquicultura em água salgada e salobra não especificados anteriormente'),
(322101, 'Criação de peixes em água doce'),
(322102, 'Criação de camarões em água doce'),
(322103, 'Criação de ostras e mexilhões em água doce'),
(322104, 'Criação de peixes ornamentais em água doce'),
(322105, 'Ranicultura'),
(322106, 'Criação de jacaré'),
(322107, 'Atividades de apoio à aquicultura em água doce'),
(322199, 'Cultivos e semicultivos da aquicultura em água doce não especificados anteriormente'),
(500301, 'Extração de carvão mineral'),
(500302, 'Beneficiamento de carvão mineral'),
(600001, 'Extração de petróleo e gás natural'),
(600002, 'Extração e beneficiamento de xisto'),
(600003, 'Extração e beneficiamento de areias betuminosas'),
(710301, 'Extração de minério de ferro'),
(710302, 'Pelotização'),
(721901, 'Extração de minério de alumínio'),
(721902, 'Beneficiamento de minério de alumínio'),
(722701, 'Extração de minério de estanho'),
(722702, 'Beneficiamento de minério de estanho'),
(723501, 'Extração de minério de manganês'),
(723502, 'Beneficiamento de minério de manganês'),
(724301, 'Extração de minério de metais preciosos'),
(724302, 'Beneficiamento de minério de metais preciosos'),
(725100, 'Extração de minerais radioativos'),
(729401, 'Extração de minérios de nióbio e titânio'),
(729402, 'Extração de minério de tungstênio'),
(729403, 'Extração de minério de níquel'),
(729404, 'Extração de minérios de cobre'),
(729405, 'Beneficiamento de minérios de cobre'),
(810001, 'Extração de ardósia e beneficiamento associado'),
(810002, 'Extração de granito e beneficiamento associado'),
(810003, 'Extração de mármore e beneficiamento associado'),
(810004, 'Extração de calcário e dolomita e beneficiamento associado'),
(810005, 'Extração de gesso e caulim'),
(810006, 'Extração de areia'),
(810007, 'Extração de argila e beneficiamento associado'),
(810008, 'Extração de saibro e beneficiamento associado'),
(810009, 'Extração de basalto e beneficiamento associado'),
(810010, 'Beneficiamento de gesso e caulim associado à extração'),
(810099, 'Extração e britamento de pedras e outros materiais para construção e beneficiamento associado'),
(891600, 'Extração de minerais para fabricação de adubos'),
(892401, 'Extração de sal marinho'),
(892402, 'Extração de sal-gema'),
(892403, 'Refino e outros tratamentos do sal'),
(893200, 'Extração de gemas (pedras preciosas e semipreciosas)'),
(899101, 'Extração de grafita'),
(899102, 'Extração de quartzo'),
(899103, 'Extração de amianto'),
(899199, 'Extração de outros minerais não metálicos não especificados anteriormente'),
(910600, 'Atividades de apoio à extração de petróleo e gás natural'),
(990401, 'Atividades de apoio à extração de minério de ferro'),
(990402, 'Atividades de apoio à extração de minerais metálicos não ferrosos'),
(990403, 'Atividades de apoio à extração de minerais não metálicos'),
(1011201, 'Frigorífico - abate de bovinos'),
(1011202, 'Frigorífico - abate de equinos'),
(1011203, 'Frigorífico - abate de ovinos e caprinos'),
(1011204, 'Frigorífico - abate de bufalinos'),
(1011205, 'Matadouro - abate de reses sob contrato'),
(1012101, 'Abate de aves'),
(1012102, 'Abate de pequenos animais'),
(1012103, 'Frigorífico - abate de suínos'),
(1012104, 'Matadouro - abate de suínos sob contrato'),
(1013901, 'Fabricação de produtos de carne'),
(1013902, 'Preparação de subprodutos do abate'),
(1020101, 'Preservação de peixes'),
(1020102, 'Fabricação de conservas de peixes'),
(1031700, 'Fabricação de conservas de frutas'),
(1032501, 'Fabricação de conservas de palmito'),
(1032599, 'Fabricação de conservas de legumes e outros vegetais'),
(1033301, 'Fabricação de sucos concentrados de frutas'),
(1033302, 'Fabricação de sucos de frutas'),
(1041400, 'Fabricação de óleos vegetais em bruto'),
(1042200, 'Fabricação de óleos vegetais refinados'),
(1043100, 'Fabricação de margarina e outras gorduras vegetais e de óleos não comestíveis de animais'),
(1051100, 'Preparação do leite'),
(1052000, 'Fabricação de laticínios'),
(1053800, 'Fabricação de sorvetes e outros gelados comestíveis'),
(1061901, 'Beneficiamento de arroz'),
(1061902, 'Fabricação de produtos do arroz'),
(1062700, 'Moagem de trigo e fabricação de derivados'),
(1063500, 'Fabricação de farinha de mandioca e derivados'),
(1064300, 'Fabricação de farinha de milho e derivados'),
(1065101, 'Fabricação de amidos e féculas de vegetais'),
(1065102, 'Fabricação de óleo de milho em bruto'),
(1065103, 'Fabricação de óleo de milho refinado'),
(1066000, 'Fabricação de alimentos para animais'),
(1069400, 'Moagem e fabricação de produtos de origem vegetal não especificados anteriormente'),
(1071600, 'Fabricação de açúcar em bruto'),
(1072401, 'Fabricação de açúcar de cana refinado'),
(1072402, 'Fabricação de açúcar de cereais (dextrose) e de beterraba'),
(1081301, 'Beneficiamento de café'),
(1081302, 'Torrefação e moagem de café'),
(1082100, 'Fabricação de produtos à base de café'),
(1091101, 'Fabricação de produtos de panificação industrial'),
(1091102, 'Fabricação de produtos de padaria e confeitaria com predominância de produção própria'),
(1092900, 'Fabricação de biscoitos e bolachas'),
(1093701, 'Fabricação de produtos derivados do cacau e de chocolates'),
(1093702, 'Fabricação de frutas cristalizadas'),
(1094500, 'Fabricação de massas alimentícias'),
(1095300, 'Fabricação de especiarias'),
(1096100, 'Fabricação de alimentos e pratos prontos'),
(1099601, 'Fabricação de vinagres'),
(1099602, 'Fabricação de pós-alimentícios'),
(1099603, 'Fabricação de fermentos e leveduras'),
(1099604, 'Fabricação de gelo comum'),
(1099605, 'Fabricação de produtos para infusão (chá'),
(1099606, 'Fabricação de adoçantes naturais e artificiais'),
(1099607, 'Fabricação de alimentos dietéticos e complementos alimentares'),
(1099699, 'Fabricação de outros produtos alimentícios não especificados anteriormente'),
(1111901, 'Fabricação de aguardente de cana-de-açúcar'),
(1111902, 'Fabricação de outras aguardentes e bebidas destiladas'),
(1112700, 'Fabricação de vinho'),
(1113501, 'Fabricação de malte'),
(1113502, 'Fabricação de cervejas e chopes'),
(1121600, 'Fabricação de águas envasadas'),
(1122401, 'Fabricação de refrigerantes'),
(1122402, 'Fabricação de chá mate e outros chás prontos para consumo'),
(1122403, 'Fabricação de refrescos'),
(1122404, 'Fabricação de bebidas isotônicas'),
(1122499, 'Fabricação de outras bebidas não alcoólicas não especificadas anteriormente'),
(1210700, 'Processamento industrial do fumo'),
(1220401, 'Fabricação de cigarros'),
(1220402, 'Fabricação de cigarrilhas e charutos'),
(1220403, 'Fabricação de filtros para cigarros'),
(1220499, 'Fabricação de outros produtos do fumo'),
(1311100, 'Preparação e fiação de fibras de algodão'),
(1312000, 'Preparação e fiação de fibras têxteis naturais'),
(1313800, 'Fiação de fibras artificiais e sintéticas'),
(1314600, 'Fabricação de linhas para costurar e bordar'),
(1321900, 'Tecelagem de fios de algodão'),
(1322700, 'Tecelagem de fios de fibras têxteis naturais'),
(1323500, 'Tecelagem de fios de fibras artificiais e sintéticas'),
(1330800, 'Fabricação de tecidos de malha'),
(1340501, 'Estamparia e texturização em fios'),
(1340502, 'Alvejamento'),
(1340599, 'Outros serviços de acabamento em fios'),
(1351100, 'Fabricação de artefatos têxteis para uso doméstico'),
(1352900, 'Fabricação de artefatos de tapeçaria'),
(1353700, 'Fabricação de artefatos de cordoaria'),
(1354500, 'Fabricação de tecidos especiais'),
(1359600, 'Fabricação de outros produtos têxteis não especificados anteriormente'),
(1411801, 'Confecção de roupas íntimas'),
(1411802, 'Facção de roupas íntimas'),
(1412601, 'Confecção de peças do vestuário'),
(1412602, 'Confecção'),
(1412603, 'Facção de peças do vestuário'),
(1413401, 'Confecção de roupas profissionais'),
(1413402, 'Confecção'),
(1413403, 'Facção de roupas profissionais'),
(1414200, 'Fabricação de acessórios do vestuário'),
(1421500, 'Fabricação de meias'),
(1422300, 'Fabricação de artigos do vestuário'),
(1510600, 'Curtimento e outras preparações de couro'),
(1521100, 'Fabricação de artigos para viagem'),
(1529700, 'Fabricação de artefatos de couro não especificados anteriormente'),
(1531901, 'Fabricação de calçados de couro'),
(1531902, 'Acabamento de calçados de couro sob contrato'),
(1532700, 'Fabricação de tênis de qualquer material'),
(1533500, 'Fabricação de calçados de material sintético'),
(1539400, 'Fabricação de calçados de materiais não especificados'),
(1540800, 'Fabricação de partes para calçados'),
(1610201, 'Serrarias com desdobramento de madeira'),
(1610203, 'Serrarias com desdobramento de madeira em bruto'),
(1610204, 'Serrarias sem desdobramento de madeira em bruto - Resseragem'),
(1610205, 'Serviço de tratamento de madeira realizado sob contrato'),
(1621800, 'Fabricação de madeira laminada e de chapas de madeira compensada'),
(1622601, 'Fabricação de casas de madeira pré-fabricadas'),
(1622602, 'Fabricação de esquadrias de madeira e de peças de madeira para instalações industriais e comerciais'),
(1622699, 'Fabricação de outros artigos de carpintaria para construção'),
(1623400, 'Fabricação de artefatos de tanoaria e de embalagens de madeira'),
(1629301, 'Fabricação de artefatos diversos de madeira'),
(1629302, 'Fabricação de artefatos diversos de cortiça'),
(1710900, 'Fabricação de celulose e outras pastas para a fabricação de papel'),
(1721400, 'Fabricação de papel'),
(1722200, 'Fabricação de cartolina e papel-cartão'),
(1731100, 'Fabricação de embalagens de papel'),
(1732000, 'Fabricação de embalagens de cartolina e papel-cartão'),
(1733800, 'Fabricação de chapas e de embalagens de papelão ondulado'),
(1741901, 'Fabricação de formulários contínuos'),
(1741902, 'Fabricação de produtos de papel'),
(1742701, 'Fabricação de fraldas descartáveis'),
(1742702, 'Fabricação de absorventes higiênicos'),
(1742799, 'Fabricação de produtos de papel para uso doméstico e higiênico-sanitário não especificados anteriormente'),
(1749400, 'Fabricação de produtos de pastas celulósicas'),
(1811301, 'Impressão de jornais'),
(1811302, 'Impressão de livros'),
(1812100, 'Impressão de material de segurança'),
(1813001, 'Impressão de material para uso publicitário'),
(1813099, 'Impressão de material para outros usos'),
(1821100, 'Serviços de pré-impressão'),
(1822901, 'Serviços de encadernação e plastificação'),
(1822999, 'Serviços de acabamentos gráficos'),
(1830001, 'Reprodução de som em qualquer suporte'),
(1830002, 'Reprodução de vídeo em qualquer suporte'),
(1830003, 'Reprodução de software em qualquer suporte'),
(1910100, 'Coquerias'),
(1921700, 'Fabricação de produtos do refino de petróleo'),
(1922501, 'Formulação de combustíveis'),
(1922502, 'Rerrefino de óleos lubrificantes'),
(1922599, 'Fabricação de outros produtos derivados do petróleo'),
(1931400, 'Fabricação de álcool'),
(1932200, 'Fabricação de biocombustíveis'),
(2011800, 'Fabricação de cloro e álcalis'),
(2012600, 'Fabricação de intermediários para fertilizantes'),
(2013401, 'Fabricação de adubos e fertilizantes organo-minerais'),
(2013402, 'Fabricação de adubos e fertilizantes'),
(2014200, 'Fabricação de gases industriais'),
(2019301, 'Elaboração de combustíveis nucleares'),
(2019399, 'Fabricação de outros produtos químicos inorgânicos não especificados anteriormente'),
(2021500, 'Fabricação de produtos petroquímicos básicos'),
(2022300, 'Fabricação de intermediários para plastificantes'),
(2029100, 'Fabricação de produtos químicos orgânicos não especificados anteriormente'),
(2031200, 'Fabricação de resinas termoplásticas'),
(2032100, 'Fabricação de resinas termofixas'),
(2033900, 'Fabricação de elastômeros'),
(2040100, 'Fabricação de fibras artificiais e sintéticas'),
(2051700, 'Fabricação de defensivos agrícolas'),
(2052500, 'Fabricação de desinfestantes domissanitários'),
(2061400, 'Fabricação de sabões e detergentes sintéticos'),
(2062200, 'Fabricação de produtos de limpeza e polimento'),
(2063100, 'Fabricação de cosméticos'),
(2071100, 'Fabricação de tintas'),
(2072000, 'Fabricação de tintas de impressão'),
(2073800, 'Fabricação de impermeabilizantes'),
(2091600, 'Fabricação de adesivos e selantes'),
(2092401, 'Fabricação de pólvoras'),
(2092402, 'Fabricação de artigos pirotécnicos'),
(2092403, 'Fabricação de fósforos de segurança'),
(2093200, 'Fabricação de aditivos de uso industrial'),
(2094100, 'Fabricação de catalisadores'),
(2099101, 'Fabricação de chapas'),
(2099199, 'Fabricação de outros produtos químicos não especificados anteriormente'),
(2110600, 'Fabricação de produtos farmoquímicos'),
(2121101, 'Fabricação de medicamentos alopáticos para uso humano'),
(2121102, 'Fabricação de medicamentos homeopáticos para uso humano'),
(2121103, 'Fabricação de medicamentos fitoterápicos para uso humano'),
(2122000, 'Fabricação de medicamentos para uso veterinário'),
(2123800, 'Fabricação de preparações farmacêuticas'),
(2211100, 'Fabricação de pneumáticos e de câmaras-de-ar'),
(2212900, 'Reforma de pneumáticos usados'),
(2219600, 'Fabricação de artefatos de borracha não especificados'),
(2221800, 'Fabricação de laminados planos e tubulares de material plástico'),
(2222600, 'Fabricação de embalagens de material plástico'),
(2223400, 'Fabricação de tubos e acessórios de material plástico para uso na construção'),
(2229301, 'Fabricação de artefatos de material plástico para uso pessoal e doméstico'),
(2229302, 'Fabricação de artefatos de material plástico para usos industriais'),
(2229303, 'Fabricação de artefatos de material plástico para uso na construção'),
(2229399, 'Fabricação de artefatos de material plástico para outros usos não especificados anteriormente'),
(2311700, 'Fabricação de vidro plano e de segurança'),
(2312500, 'Fabricação de embalagens de vidro'),
(2319200, 'Fabricação de artigos de vidro'),
(2320600, 'Fabricação de cimento'),
(2330301, 'Fabricação de estruturas pré-moldadas de concreto armado'),
(2330302, 'Fabricação de artefatos de cimento para uso na construção'),
(2330303, 'Fabricação de artefatos de fibrocimento para uso na construção'),
(2330304, 'Fabricação de casas pré-moldadas de concreto'),
(2330305, 'Preparação de massa de concreto e argamassa para construção'),
(2330399, 'Fabricação de outros artefatos e produtos de concreto'),
(2341900, 'Fabricação de produtos cerâmicos refratários'),
(2342701, 'Fabricação de azulejos e pisos'),
(2342702, 'Fabricação de artefatos de cerâmica e barro cozido para uso na construção'),
(2349401, 'Fabricação de material sanitário de cerâmica'),
(2349499, 'Fabricação de produtos cerâmicos não refratários não especificados anteriormente'),
(2391501, 'Britamento de pedras'),
(2391502, 'Aparelhamento de pedras para construção'),
(2391503, 'Aparelhamento de placas e execução de trabalhos em mármore'),
(2392300, 'Fabricação de cal e gesso'),
(2399101, 'Decoração'),
(2399102, 'Fabricação de abrasivos'),
(2399199, 'Fabricação de outros produtos de minerais não metálicos não especificados anteriormente'),
(2411300, 'Produção de ferro-gusa'),
(2412100, 'Produção de ferroligas'),
(2421100, 'Produção de semiacabados de aço'),
(2422901, 'Produção de laminados planos de aço ao carbono'),
(2422902, 'Produção de laminados planos de aços especiais'),
(2423701, 'Produção de tubos de aço sem costura'),
(2423702, 'Produção de laminados longos de aço'),
(2424501, 'Produção de arames de aço'),
(2424502, 'Produção de relaminados'),
(2431800, 'Produção de tubos de aço com costura'),
(2439300, 'Produção de outros tubos de ferro e aço'),
(2441501, 'Produção de alumínio e suas ligas em formas primárias'),
(2441502, 'Produção de laminados de alumínio'),
(2442300, 'Metalurgia dos metais preciosos'),
(2443100, 'Metalurgia do cobre'),
(2449101, 'Produção de zinco em formas primárias'),
(2449102, 'Produção de laminados de zinco'),
(2449103, 'Fabricação de ânodos para galvanoplastia'),
(2449199, 'Metalurgia de outros metais não ferrosos e suas ligas não especificados anteriormente'),
(2451200, 'Fundição de ferro e aço'),
(2452100, 'Fundição de metais não ferrosos e suas ligas'),
(2511000, 'Fabricação de estruturas metálicas'),
(2512800, 'Fabricação de esquadrias de metal'),
(2513600, 'Fabricação de obras de caldeiraria pesada'),
(2521700, 'Fabricação de tanques'),
(2522500, 'Fabricação de caldeiras geradoras de vapor'),
(2531401, 'Produção de forjados de aço'),
(2531402, 'Produção de forjados de metais não ferrosos e suas ligas'),
(2532201, 'Produção de artefatos estampados de metal'),
(2532202, 'Metalurgia do pó'),
(2539001, 'Serviços de usinagem'),
(2539002, 'Serviços de tratamento e revestimento em metais'),
(2541100, 'Fabricação de artigos de cutelaria'),
(2542000, 'Fabricação de artigos de serralheria'),
(2543800, 'Fabricação de ferramentas'),
(2550101, 'Fabricação de equipamento bélico pesado'),
(2550102, 'Fabricação de armas de fogo'),
(2591800, 'Fabricação de embalagens metálicas'),
(2592601, 'Fabricação de produtos de trefilados de metal padronizados'),
(2592602, 'Fabricação de produtos de trefilados de metal'),
(2593400, 'Fabricação de artigos de metal para uso doméstico e pessoal'),
(2599301, 'Serviços de confecção de armações metálicas para a construção'),
(2599302, 'Serviço de corte e dobra de metais'),
(2599399, 'Fabricação de outros produtos de metal não especificados anteriormente'),
(2610800, 'Fabricação de componentes eletrônicos'),
(2621300, 'Fabricação de equipamentos de informática'),
(2622100, 'Fabricação de periféricos para equipamentos de informática'),
(2631100, 'Fabricação de equipamentos transmissores de comunicação'),
(2632900, 'Fabricação de aparelhos telefônicos e de outros equipamentos de comunicação'),
(2640000, 'Fabricação de aparelhos de recepção'),
(2651500, 'Fabricação de aparelhos e equipamentos de medida'),
(2652300, 'Fabricação de cronômetros e relógios'),
(2660400, 'Fabricação de aparelhos eletromédicos e eletroterapêuticos e equipamentos de irradiação'),
(2670101, 'Fabricação de equipamentos e instrumentos ópticos'),
(2670102, 'Fabricação de aparelhos fotográficos e cinematográficos'),
(2680900, 'Fabricação de mídias virgens'),
(2710401, 'Fabricação de geradores de corrente contínua e alternada'),
(2710402, 'Fabricação de transformadores'),
(2710403, 'Fabricação de motores elétricos'),
(2721000, 'Fabricação de pilhas'),
(2722801, 'Fabricação de baterias e acumuladores para veículos automotores'),
(2722802, 'Recondicionamento de baterias e acumuladores para veículos automotores'),
(2731700, 'Fabricação de aparelhos e equipamentos para distribuição e controle de energia elétrica'),
(2732500, 'Fabricação de material elétrico para instalações em circuito de consumo'),
(2733300, 'Fabricação de fios'),
(2740601, 'Fabricação de lâmpadas'),
(2740602, 'Fabricação de luminárias e outros equipamentos de iluminação'),
(2751100, 'Fabricação de fogões'),
(2759701, 'Fabricação de aparelhos elétricos de uso pessoal'),
(2759799, 'Fabricação de outros aparelhos eletrodomésticos não especificados anteriormente'),
(2790201, 'Fabricação de eletrodos'),
(2790202, 'Fabricação de equipamentos para sinalização e alarme'),
(2790299, 'Fabricação de outros equipamentos e aparelhos elétricos não especificados anteriormente'),
(2811900, 'Fabricação de motores e turbinas'),
(2812700, 'Fabricação de equipamentos hidráulicos e pneumáticos'),
(2813500, 'Fabricação de válvulas'),
(2814301, 'Fabricação de compressores para uso industrial'),
(2814302, 'Fabricação de compressores para uso não industrial'),
(2815101, 'Fabricação de rolamentos para fins industriais'),
(2815102, 'Fabricação de equipamentos de transmissão para fins industriais'),
(2821601, 'Fabricação de fornos industriais'),
(2821602, 'Fabricação de estufas e fornos elétricos para fins industriais'),
(2822401, 'Fabricação de máquinas'),
(2822402, 'Fabricação de máquinas'),
(2823200, 'Fabricação de máquinas e aparelhos de refrigeração e ventilação para uso industrial e comercial'),
(2824101, 'Fabricação de aparelhos e equipamentos de ar condicionado para uso industrial'),
(2824102, 'Fabricação de aparelhos e equipamentos de ar condicionado para uso não industrial'),
(2825900, 'Fabricação de máquinas e equipamentos para saneamento básico e ambiental'),
(2829101, 'Fabricação de máquinas de escrever'),
(2829199, 'Fabricação de outras máquinas e equipamentos de uso geral não especificados anteriormente'),
(2831300, 'Fabricação de tratores agrícolas'),
(2832100, 'Fabricação de equipamentos para irrigação agrícola'),
(2833000, 'Fabricação de máquinas e equipamentos para a agricultura e pecuária'),
(2840200, 'Fabricação de máquinas-ferramenta'),
(2851800, 'Fabricação de máquinas e equipamentos para a prospecção e extração de petróleo'),
(2852600, 'Fabricação de outras máquinas e equipamentos para uso na extração mineral'),
(2853400, 'Fabricação de tratores'),
(2854200, 'Fabricação de máquinas e equipamentos para terraplenagem'),
(2861500, 'Fabricação de máquinas para a indústria metalúrgica'),
(2862300, 'Fabricação de máquinas e equipamentos para as indústrias de alimentos'),
(2863100, 'Fabricação de máquinas e equipamentos para a indústria têxtil'),
(2864000, 'Fabricação de máquinas e equipamentos para as indústrias do vestuário'),
(2865800, 'Fabricação de máquinas e equipamentos para as indústrias de celulose'),
(2866600, 'Fabricação de máquinas e equipamentos para a indústria do plástico'),
(2869100, 'Fabricação de máquinas e equipamentos para uso industrial específico não especificados anteriormente'),
(2910701, 'Fabricação de automóveis'),
(2910702, 'Fabricação de chassis com motor para automóveis'),
(2910703, 'Fabricação de motores para automóveis'),
(2920401, 'Fabricação de caminhões e ônibus'),
(2920402, 'Fabricação de motores para caminhões e ônibus'),
(2930101, 'Fabricação de cabines'),
(2930102, 'Fabricação de carrocerias para ônibus'),
(2930103, 'Fabricação de cabines'),
(2941700, 'Fabricação de peças e acessórios para o sistema motor de veículos automotores'),
(2942500, 'Fabricação de peças e acessórios para os sistemas de marcha e transmissão de veículos automotores'),
(2943300, 'Fabricação de peças e acessórios para o sistema de freios de veículos automotores'),
(2944100, 'Fabricação de peças e acessórios para o sistema de direção e suspensão de veículos automotores'),
(2945000, 'Fabricação de material elétrico e eletrônico para veículos automotores'),
(2949201, 'Fabricação de bancos e estofados para veículos automotores'),
(2949299, 'Fabricação de outras peças e acessórios para veículos automotores não especificadas anteriormente'),
(2950600, 'Recondicionamento e recuperação de motores para veículos automotores'),
(3011301, 'Construção de embarcações de grande porte'),
(3011302, 'Construção de embarcações para uso comercial e para usos especiais'),
(3012100, 'Construção de embarcações para esporte e lazer'),
(3031800, 'Fabricação de locomotivas'),
(3032600, 'Fabricação de peças e acessórios para veículos ferroviários'),
(3041500, 'Fabricação de aeronaves'),
(3042300, 'Fabricação de turbinas'),
(3050400, 'Fabricação de veículos militares de combate'),
(3091101, 'Fabricação de motocicletas'),
(3091102, 'Fabricação de peças e acessórios para motocicletas'),
(3092000, 'Fabricação de bicicletas e triciclos não motorizados'),
(3099700, 'Fabricação de equipamentos de transporte não especificados anteriormente'),
(3101200, 'Fabricação de móveis com predominância de madeira'),
(3102100, 'Fabricação de móveis com predominância de metal'),
(3103900, 'Fabricação de móveis de outros materiais'),
(3104700, 'Fabricação de colchões'),
(3211601, 'Lapidação de gemas'),
(3211602, 'Fabricação de artefatos de joalheria e ourivesaria'),
(3211603, 'Cunhagem de moedas e medalhas'),
(3212400, 'Fabricação de bijuterias e artefatos semelhantes'),
(3220500, 'Fabricação de instrumentos musicais'),
(3230200, 'Fabricação de artefatos para pesca e esporte'),
(3240001, 'Fabricação de jogos eletrônicos'),
(3240002, 'Fabricação de mesas de bilhar'),
(3240003, 'Fabricação de mesas de bilhar'),
(3240099, 'Fabricação de outros brinquedos e jogos recreativos não especificados anteriormente'),
(3250701, 'Fabricação de instrumentos não eletrônicos e utensílios para uso médico'),
(3250702, 'Fabricação de mobiliário para uso médico'),
(3250703, 'Fabricação de aparelhos e utensílios para correção de defeitos físicos e aparelhos ortopédicos em geral sob encomenda'),
(3250704, 'Fabricação de aparelhos e utensílios para correção de defeitos físicos e aparelhos ortopédicos em geral'),
(3250705, 'Fabricação de materiais para medicina e odontologia'),
(3250706, 'Serviços de prótese dentária'),
(3250707, 'Fabricação de artigos ópticos'),
(3250709, 'Serviço de laboratório óptico'),
(3291400, 'Fabricação de escovas'),
(3292201, 'Fabricação de roupas de proteção e segurança e resistentes a fogo'),
(3292202, 'Fabricação de equipamentos e acessórios para segurança pessoal e profissional'),
(3299001, 'Fabricação de guarda-chuvas e similares'),
(3299002, 'Fabricação de canetas'),
(3299003, 'Fabricação de letras'),
(3299004, 'Fabricação de painéis e letreiros luminosos'),
(3299005, 'Fabricação de aviamentos para costura'),
(3299006, 'Fabricação de velas'),
(3299099, 'Fabricação de produtos diversos não especificados anteriormente'),
(3311200, 'Manutenção e reparação de tanques'),
(3312102, 'Manutenção e reparação de aparelhos e instrumentos de medida'),
(3312103, 'Manutenção e reparação de aparelhos eletromédicos e eletroterapêuticos e equipamentos de irradiação'),
(3312104, 'Manutenção e reparação de equipamentos e instrumentos ópticos'),
(3313901, 'Manutenção e reparação de geradores'),
(3313902, 'Manutenção e reparação de baterias e acumuladores elétricos'),
(3313999, 'Manutenção e reparação de máquinas'),
(3314701, 'Manutenção e reparação de máquinas motrizes não elétricas'),
(3314702, 'Manutenção e reparação de equipamentos hidráulicos e pneumáticos'),
(3314703, 'Manutenção e reparação de válvulas industriais'),
(3314704, 'Manutenção e reparação de compressores'),
(3314705, 'Manutenção e reparação de equipamentos de transmissão para fins industriais'),
(3314706, 'Manutenção e reparação de máquinas'),
(3314707, 'Manutenção e reparação de máquinas e aparelhos de refrigeração e ventilação para uso industrial e comercial'),
(3314708, 'Manutenção e reparação de máquinas'),
(3314709, 'Manutenção e reparação de máquinas de escrever'),
(3314710, 'Manutenção e reparação de máquinas e equipamentos para uso geral não especificados anteriormente'),
(3314711, 'Manutenção e reparação de máquinas e equipamentos para agricultura e pecuária'),
(3314712, 'Manutenção e reparação de tratores agrícolas'),
(3314713, 'Manutenção e reparação de máquinas-ferramenta'),
(3314714, 'Manutenção e reparação de máquinas e equipamentos para a prospecção e extração de petróleo'),
(3314715, 'Manutenção e reparação de máquinas e equipamentos para uso na extração mineral'),
(3314716, 'Manutenção e reparação de tratores'),
(3314717, 'Manutenção e reparação de máquinas e equipamentos de terraplenagem'),
(3314718, 'Manutenção e reparação de máquinas para a indústria metalúrgica'),
(3314719, 'Manutenção e reparação de máquinas e equipamentos para as indústrias de alimentos'),
(3314720, 'Manutenção e reparação de máquinas e equipamentos para a indústria têxtil'),
(3314721, 'Manutenção e reparação de máquinas e aparelhos para a indústria de celulose'),
(3314722, 'Manutenção e reparação de máquinas e aparelhos para a indústria do plástico'),
(3314799, 'Manutenção e reparação de outras máquinas e equipamentos para usos industriais não especificados anteriormente'),
(3315500, 'Manutenção e reparação de veículos ferroviários'),
(3316301, 'Manutenção e reparação de aeronaves'),
(3316302, 'Manutenção de aeronaves na pista'),
(3319800, 'Manutenção e reparação de equipamentos e produtos não especificados anteriormente'),
(3321000, 'Instalação de máquinas e equipamentos industriais'),
(3329501, 'Serviços de montagem de móveis de qualquer material'),
(3329599, 'Instalação de outros equipamentos não especificados anteriormente'),
(3511501, 'Geração de energia elétrica'),
(3511502, 'Atividades de coordenação e controle da operação da geração e transmissão de energia elétrica'),
(3512300, 'Transmissão de energia elétrica'),
(3513100, 'Comércio atacadista de energia elétrica'),
(3514000, 'Distribuição de energia elétrica'),
(3520401, 'Produção de gás; processamento de gás natural'),
(3520402, 'Distribuição de combustíveis gasosos por redes urbanas'),
(3530100, 'Produção e distribuição de vapor'),
(3600601, 'Captação'),
(3600602, 'Distribuição de água por caminhões'),
(3701100, 'Gestão de redes de esgoto'),
(3702900, 'Atividades relacionadas a esgoto'),
(3811400, 'Coleta de resíduos não perigosos'),
(3812200, 'Coleta de resíduos perigosos'),
(3821100, 'Tratamento e disposição de resíduos não perigosos'),
(3822000, 'Tratamento e disposição de resíduos perigosos'),
(3831901, 'Recuperação de sucatas de alumínio'),
(3831999, 'Recuperação de materiais metálicos'),
(3832700, 'Recuperação de materiais plásticos'),
(3839401, 'Usinas de compostagem'),
(3839499, 'Recuperação de materiais não especificados anteriormente'),
(3900500, 'Descontaminação e outros serviços de gestão de resíduos'),
(4110700, 'Incorporação de empreendimentos imobiliários'),
(4120400, 'Construção de edifícios'),
(4211101, 'Construção de rodovias e ferrovias'),
(4211102, 'Pintura para sinalização em pistas rodoviárias e aeroportos'),
(4212000, 'Construção de obras de arte especiais'),
(4213800, 'Obras de urbanização - ruas'),
(4221901, 'Construção de barragens e represas para geração de energia'),
(4221902, 'Construção de estações e redes de distribuição de energia elétrica'),
(4221903, 'Manutenção de redes de distribuição de energia elétrica'),
(4221904, 'Construção de estações e redes de telecomunicações'),
(4221905, 'Manutenção de estações e redes de telecomunicações'),
(4222701, 'Construção de redes de abastecimento de água'),
(4222702, 'Obras de irrigação'),
(4223500, 'Construção de redes de transportes por dutos'),
(4291000, 'Obras portuárias'),
(4292801, 'Montagem de estruturas metálicas'),
(4292802, 'Obras de montagem industrial'),
(4299501, 'Construção de instalações esportivas e recreativas'),
(4299599, 'Outras obras de engenharia civil não especificadas anteriormente'),
(4311801, 'Demolição de edifícios e outras estruturas'),
(4311802, 'Preparação de canteiro e limpeza de terreno'),
(4312600, 'Perfurações e sondagens'),
(4313400, 'Obras de terraplenagem'),
(4319300, 'Serviços de preparação do terreno não especificados anteriormente'),
(4321500, 'Instalação e manutenção elétrica'),
(4322301, 'Instalações hidráulicas'),
(4322302, 'Instalação e manutenção de sistemas centrais de ar condicionado'),
(4322303, 'Instalações de sistema de prevenção contra incêndio'),
(4329101, 'Instalação de painéis publicitários'),
(4329102, 'Instalação de equipamentos para orientação à navegação marítima'),
(4329103, 'Instalação'),
(4329104, 'Montagem e instalação de sistemas e equipamentos de iluminação e sinalização em vias públicas'),
(4329105, 'Tratamentos térmicos'),
(4329199, 'Outras obras de instalações em construções não especificadas anteriormente'),
(4330401, 'Impermeabilização em obras de engenharia civil'),
(4330402, 'Instalação de portas'),
(4330403, 'Obras de acabamento em gesso e estuque'),
(4330404, 'Serviços de pintura de edifícios em geral'),
(4330405, 'Aplicação de revestimentos e de resinas em interiores e exteriores'),
(4330499, 'Outras obras de acabamento da construção'),
(4391600, 'Obras de fundações'),
(4399101, 'Administração de obras'),
(4399102, 'Montagem e desmontagem de andaimes e outras estruturas temporárias'),
(4399103, 'Obras de alvenaria'),
(4399104, 'Serviços de operação e fornecimento de equipamentos para transporte e elevação de cargas e pessoas para uso em obras'),
(4399105, 'Perfuração e construção de poços de água'),
(4399199, 'Serviços especializados para construção não especificados anteriormente'),
(4511101, 'Comércio a varejo de automóveis'),
(4511102, 'Comércio a varejo de automóveis'),
(4511103, 'Comércio por atacado de automóveis'),
(4511104, 'Comércio por atacado de caminhões novos e usados'),
(4511105, 'Comércio por atacado de reboques e semireboques novos e usados'),
(4511106, 'Comércio por atacado de ônibus e micro-ônibus novos e usados'),
(4512901, 'Representantes comerciais e agentes do comércio de veículos automotores'),
(4512902, 'Comércio sob consignação de veículos automotores'),
(4520001, 'Serviços de manutenção e reparação mecânica de veículos automotores'),
(4520002, 'Serviços de lanternagem ou funilaria e pintura de veículos automotores'),
(4520003, 'Serviços de manutenção e reparação elétrica de veículos automotores'),
(4520004, 'Serviços de alinhamento e balanceamento de veículos automotores'),
(4520005, 'Serviços de lavagem'),
(4520006, 'Serviços de borracharia para veículos automotores'),
(4520007, 'Serviços de instalação'),
(4520008, 'Serviços de capotaria'),
(4530701, 'Comércio por atacado de peças e acessórios novos para veículos automotores'),
(4530702, 'Comércio por atacado de pneumáticos e câmaras-de-ar'),
(4530703, 'Comércio a varejo de peças e acessórios novos para veículos automotores'),
(4530704, 'Comércio a varejo de peças e acessórios usados para veículos automotores'),
(4530705, 'Comércio a varejo de pneumáticos e câmaras-de-ar'),
(4530706, 'Representantes comerciais e agentes do comércio de peças e acessórios novos e usados para veículos automotores'),
(4541201, 'Comércio por atacado de motocicletas e motonetas'),
(4541202, 'Comércio por atacado de peças e acessórios para motocicletas e motonetas'),
(4541203, 'Comércio a varejo de motocicletas e motonetas novas'),
(4541204, 'Comércio a varejo de motocicletas e motonetas usadas'),
(4541206, 'Comércio a varejo de peças e acessórios novos para motocicletas e motonetas'),
(4541207, 'Comércio a varejo de peças e acessórios usados para motocicletas e motonetas'),
(4542101, 'Representantes comerciais e agentes do comércio de motocicletas e motonetas'),
(4542102, 'Comércio sob consignação de motocicletas e motonetas'),
(4543900, 'Manutenção e reparação de motocicletas e motonetas'),
(4611700, 'Representantes comerciais e agentes do comércio de matérias-primas agrícolas e animais vivos'),
(4612500, 'Representantes comerciais e agentes do comércio de combustíveis'),
(4613300, 'Representantes comerciais e agentes do comércio de madeira'),
(4614100, 'Representantes comerciais e agentes do comércio de máquinas'),
(4615000, 'Representantes comerciais e agentes do comércio de eletrodomésticos'),
(4616800, 'Representantes comerciais e agentes do comércio de têxteis'),
(4617600, 'Representantes comerciais e agentes do comércio de produtos alimentícios'),
(4618401, 'Representantes comerciais e agentes do comércio de medicamentos'),
(4618402, 'Representantes comerciais e agentes do comércio de instrumentos e materiais odonto-médico-hospitalares'),
(4618403, 'Representantes comerciais e agentes do comércio de jornais'),
(4618499, 'Outros representantes comerciais e agentes do comércio especializado em produtos não especificados anteriormente'),
(4619200, 'Representantes comerciais e agentes do comércio de mercadorias em geral não especializado'),
(4621400, 'Comércio atacadista de café em grão'),
(4622200, 'Comércio atacadista de soja'),
(4623101, 'Comércio atacadista de animais vivos'),
(4623102, 'Comércio atacadista de couros'),
(4623103, 'Comércio atacadista de algodão'),
(4623104, 'Comércio atacadista de fumo em folha não beneficiado'),
(4623105, 'Comércio atacadista de cacau'),
(4623106, 'Comércio atacadista de sementes'),
(4623107, 'Comércio atacadista de sisal'),
(4623108, 'Comércio atacadista de matérias-primas agrícolas com atividade de fracionamento e acondicionamento associada'),
(4623109, 'Comércio atacadista de alimentos para animais'),
(4623199, 'Comércio atacadista de matérias-primas agrícolas não especificadas anteriormente'),
(4631100, 'Comércio atacadista de leite e laticínios'),
(4632001, 'Comércio atacadista de cereais e leguminosas beneficiados'),
(4632002, 'Comércio atacadista de farinhas'),
(4632003, 'Comércio atacadista de cereais e leguminosas beneficiados'),
(4633801, 'Comércio atacadista de frutas'),
(4633802, 'Comércio atacadista de aves vivas e ovos'),
(4633803, 'Comércio atacadista de coelhos e outros pequenos animais vivos para alimentação'),
(4634601, 'Comércio atacadista de carnes bovinas e suínas e derivados'),
(4634602, 'Comércio atacadista de aves abatidas e derivados'),
(4634603, 'Comércio atacadista de pescados e frutos do mar'),
(4634699, 'Comércio atacadista de carnes e derivados de outros animais'),
(4635401, 'Comércio atacadista de água mineral'),
(4635402, 'Comércio atacadista de cerveja'),
(4635403, 'Comércio atacadista de bebidas com atividade de fracionamento e acondicionamento associada'),
(4635499, 'Comércio atacadista de bebidas não especificadas anteriormente'),
(4636201, 'Comércio atacadista de fumo beneficiado'),
(4636202, 'Comércio atacadista de cigarros'),
(4637101, 'Comércio atacadista de café torrado'),
(4637102, 'Comércio atacadista de açúcar'),
(4637103, 'Comércio atacadista de óleos e gorduras'),
(4637104, 'Comércio atacadista de pães'),
(4637105, 'Comércio atacadista de massas alimentícias'),
(4637106, 'Comércio atacadista de sorvetes'),
(4637107, 'Comércio atacadista de chocolates'),
(4637199, 'Comércio atacadista especializado em outros produtos alimentícios não especificados anteriormente'),
(4639701, 'Comércio atacadista de produtos alimentícios em geral'),
(4639702, 'Comércio atacadista de produtos alimentícios em geral'),
(4641901, 'Comércio atacadista de tecidos'),
(4641902, 'Comércio atacadista de artigos de cama'),
(4641903, 'Comércio atacadista de artigos de armarinho'),
(4642701, 'Comércio atacadista de artigos do vestuário e acessórios'),
(4642702, 'Comércio atacadista de roupas e acessórios para uso profissional e de segurança do trabalho'),
(4643501, 'Comércio atacadista de calçados'),
(4643502, 'Comércio atacadista de bolsas'),
(4644301, 'Comércio atacadista de medicamentos e drogas de uso humano'),
(4644302, 'Comércio atacadista de medicamentos e drogas de uso veterinário'),
(4645101, 'Comércio atacadista de instrumentos e materiais para uso médico'),
(4645102, 'Comércio atacadista de próteses e artigos de ortopedia'),
(4645103, 'Comércio atacadista de produtos odontológicos'),
(4646001, 'Comércio atacadista de cosméticos e produtos de perfumaria'),
(4646002, 'Comércio atacadista de produtos de higiene pessoal'),
(4647801, 'Comércio atacadista de artigos de escritório e de papelaria'),
(4647802, 'Comércio atacadista de livros'),
(4649401, 'Comércio atacadista de equipamentos elétricos de uso pessoal e doméstico'),
(4649402, 'Comércio atacadista de aparelhos eletrônicos de uso pessoal e doméstico'),
(4649403, 'Comércio atacadista de bicicletas'),
(4649404, 'Comércio atacadista de móveis e artigos de colchoaria'),
(4649405, 'Comércio atacadista de artigos de tapeçaria; persianas e cortinas'),
(4649406, 'Comércio atacadista de lustres'),
(4649407, 'Comércio atacadista de filmes'),
(4649408, 'Comércio atacadista de produtos de higiene'),
(4649409, 'Comércio atacadista de produtos de higiene'),
(4649410, 'Comércio atacadista de jóias'),
(4649499, 'Comércio atacadista de outros equipamentos e artigos de uso pessoal e doméstico não especificados anteriormente'),
(4651601, 'Comércio atacadista de equipamentos de informática'),
(4651602, 'Comércio atacadista de suprimentos para informática'),
(4652400, 'Comércio atacadista de componentes eletrônicos e equipamentos de telefonia e comunicação'),
(4661300, 'Comércio atacadista de máquinas'),
(4662100, 'Comércio atacadista de máquinas'),
(4663000, 'Comércio atacadista de máquinas e equipamentos para uso industrial; partes e peças'),
(4664800, 'Comércio atacadista de máquinas'),
(4665600, 'Comércio atacadista de máquinas e equipamentos para uso comercial; partes e peças'),
(4669901, 'Comércio atacadista de bombas e compressores; partes e peças'),
(4669999, 'Comércio atacadista de outras máquinas e equipamentos não especificados anteriormente; partes e peças'),
(4671100, 'Comércio atacadista de madeira e produtos derivados'),
(4672900, 'Comércio atacadista de ferragens e ferramentas'),
(4673700, 'Comércio atacadista de material elétrico'),
(4674500, 'Comércio atacadista de cimento'),
(4679601, 'Comércio atacadista de tintas'),
(4679602, 'Comércio atacadista de mármores e granitos'),
(4679603, 'Comércio atacadista de vidros'),
(4679604, 'Comércio atacadista especializado de materiais de construção não especificados anteriormente'),
(4679699, 'Comércio atacadista de materiais de construção em geral'),
(4681801, 'Comércio atacadista de álcool carburante'),
(4681802, 'Comércio atacadista de combustíveis realizado por transportador retalhista (TRR)'),
(4681803, 'Comércio atacadista de combustíveis de origem vegetal'),
(4681804, 'Comércio atacadista de combustíveis de origem mineral em bruto'),
(4681805, 'Comércio atacadista de lubrificantes'),
(4682600, 'Comércio atacadista de gás liquefeito de petróleo (GLP)'),
(4683400, 'Comércio atacadista de defensivos agrícolas'),
(4684201, 'Comércio atacadista de resinas e elastômeros'),
(4684202, 'Comércio atacadista de solventes'),
(4684299, 'Comércio atacadista de outros produtos químicos e petroquímicos não especificados anteriormente'),
(4685100, 'Comércio atacadista de produtos siderúrgicos e metalúrgicos'),
(4686901, 'Comércio atacadista de papel e papelão em bruto'),
(4686902, 'Comércio atacadista de embalagens'),
(4687701, 'Comércio atacadista de resíduos de papel e papelão'),
(4687702, 'Comércio atacadista de resíduos e sucatas não metálicos'),
(4687703, 'Comércio atacadista de resíduos e sucatas metálicos'),
(4689301, 'Comércio atacadista de produtos da extração mineral'),
(4689302, 'Comércio atacadista de fios e fibras beneficiados'),
(4689399, 'Comércio atacadista especializado em outros produtos intermediários não especificados anteriormente'),
(4691500, 'Comércio atacadista de mercadorias em geral'),
(4692300, 'Comércio atacadista de mercadorias em geral'),
(4693100, 'Comércio atacadista de mercadorias em geral'),
(4711301, 'Comércio varejista de mercadorias em geral'),
(4711302, 'Comércio varejista de mercadorias em geral'),
(4712100, 'Comércio varejista de mercadorias em geral'),
(4713001, 'Lojas de departamentos ou magazines'),
(4713002, 'Lojas de variedades'),
(4713004, 'Lojas de departamentos ou magazines'),
(4713005, 'Lojas francas (Duty Free) de aeroportos'),
(4721102, 'Padaria e confeitaria com predominância de revenda'),
(4721103, 'Comércio varejista de laticínios e frios'),
(4721104, 'Comércio varejista de doces'),
(4722901, 'Comércio varejista de carnes - açougues'),
(4722902, 'Peixaria'),
(4723700, 'Comércio varejista de bebidas'),
(4724500, 'Comércio varejista de hortifrutigranjeiros'),
(4729601, 'Tabacaria'),
(4729602, 'Comércio varejista de mercadorias em lojas de conveniência'),
(4729699, 'Comércio varejista de produtos alimentícios em geral ou especializado em produtos alimentícios não especificados anteriormente'),
(4731800, 'Comércio varejista de combustíveis para veículos automotores'),
(4732600, 'Comércio varejista de lubrificantes'),
(4741500, 'Comércio varejista de tintas e materiais para pintura'),
(4742300, 'Comércio varejista de material elétrico'),
(4743100, 'Comércio varejista de vidros'),
(4744001, 'Comércio varejista de ferragens e ferramentas'),
(4744002, 'Comércio varejista de madeira e artefatos'),
(4744003, 'Comércio varejista de materiais hidráulicos'),
(4744004, 'Comércio varejista de cal'),
(4744005, 'Comércio varejista de materiais de construção não especificados anteriormente'),
(4744006, 'Comércio varejista de pedras para revestimento'),
(4744099, 'Comércio varejista de materiais de construção em geral'),
(4751201, 'Comércio varejista especializado de equipamentos e suprimentos de informática'),
(4751202, 'Recarga de cartuchos para equipamentos de informática'),
(4752100, 'Comércio varejista especializado de equipamentos de telefonia e comunicação'),
(4753900, 'Comércio varejista especializado de eletrodomésticos e equipamentos de áudio e vídeo'),
(4754701, 'Comércio varejista de móveis'),
(4754702, 'Comércio varejista de artigos de colchoaria'),
(4754703, 'Comércio varejista de artigos de iluminação'),
(4755501, 'Comércio varejista de tecidos'),
(4755502, 'Comercio varejista de artigos de armarinho'),
(4755503, 'Comercio varejista de artigos de cama'),
(4756300, 'Comércio varejista especializado de instrumentos musicais e acessórios'),
(4757100, 'Comércio varejista especializado de peças e acessórios para aparelhos eletroeletrônicos para uso doméstico'),
(4759801, 'Comércio varejista de artigos de tapeçaria'),
(4759899, 'Comércio varejista de outros artigos de uso doméstico não especificados anteriormente'),
(4761001, 'Comércio varejista de livros'),
(4761002, 'Comércio varejista de jornais e revistas'),
(4761003, 'Comércio varejista de artigos de papelaria'),
(4762800, 'Comércio varejista de discos'),
(4763601, 'Comércio varejista de brinquedos e artigos recreativos'),
(4763602, 'Comércio varejista de artigos esportivos'),
(4763603, 'Comércio varejista de bicicletas e triciclos; peças e acessórios'),
(4763604, 'Comércio varejista de artigos de caça'),
(4763605, 'Comércio varejista de embarcações e outros veículos recreativos; peças e acessórios'),
(4771701, 'Comércio varejista de produtos farmacêuticos'),
(4771702, 'Comércio varejista de produtos farmacêuticos'),
(4771703, 'Comércio varejista de produtos farmacêuticos homeopáticos'),
(4771704, 'Comércio varejista de medicamentos veterinários'),
(4772500, 'Comércio varejista de cosméticos'),
(4773300, 'Comércio varejista de artigos médicos e ortopédicos'),
(4774100, 'Comércio varejista de artigos de óptica'),
(4781400, 'Comércio varejista de artigos do vestuário e acessórios'),
(4782201, 'Comércio varejista de calçados'),
(4782202, 'Comércio varejista de artigos de viagem'),
(4783101, 'Comércio varejista de artigos de joalheria'),
(4783102, 'Comércio varejista de artigos de relojoaria'),
(4784900, 'Comércio varejista de gás liqüefeito de petróleo (GLP)'),
(4785701, 'Comércio varejista de antiguidades'),
(4785799, 'Comércio varejista de outros artigos usados'),
(4789001, 'Comércio varejista de suvenires'),
(4789002, 'Comércio varejista de plantas e flores naturais'),
(4789003, 'Comércio varejista de objetos de arte');
INSERT INTO `cnae` (`idCNAE`, `CNAE_Principal`) VALUES
(4789004, 'Comércio varejista de animais vivos e de artigos e alimentos para animais de estimação'),
(4789005, 'Comércio varejista de produtos saneantes domissanitários'),
(4789006, 'Comércio varejista de fogos de artifício e artigos pirotécnicos'),
(4789007, 'Comércio varejista de equipamentos para escritório'),
(4789008, 'Comércio varejista de artigos fotográficos e para filmagem'),
(4789009, 'Comércio varejista de armas e munições'),
(4789099, 'Comércio varejista de outros produtos não especificados anteriormente'),
(4911600, 'Transporte ferroviário de carga'),
(4912401, 'Transporte ferroviário de passageiros intermunicipal e interestadual'),
(4912402, 'Transporte ferroviário de passageiros municipal e em região metropolitana'),
(4912403, 'Transporte metroviário'),
(4921301, 'Transporte rodoviário coletivo de passageiros'),
(4921302, 'Transporte rodoviário coletivo de passageiros'),
(4922101, 'Transporte rodoviário coletivo de passageiros'),
(4922102, 'Transporte rodoviário coletivo de passageiros'),
(4922103, 'Transporte rodoviário coletivo de passageiros'),
(4923001, 'Serviço de táxi'),
(4923002, 'Serviço de transporte de passageiros - locação de automóveis com motorista'),
(4924800, 'Transporte escolar'),
(4929901, 'Transporte rodoviário coletivo de passageiros'),
(4929902, 'Transporte rodoviário coletivo de passageiros'),
(4929903, 'Organização de excursões em veículos rodoviários próprios'),
(4929904, 'Organização de excursões em veículos rodoviários próprios'),
(4929999, 'Outros transportes rodoviários de passageiros não especificados anteriormente'),
(4930201, 'Transporte rodoviário de carga'),
(4930202, 'Transporte rodoviário de carga'),
(4930203, 'Transporte rodoviário de produtos perigosos'),
(4930204, 'Transporte rodoviário de mudanças'),
(4940000, 'Transporte dutoviário'),
(4950700, 'Trens turísticos'),
(5011401, 'Transporte marítimo de cabotagem - Carga'),
(5011402, 'Transporte marítimo de cabotagem - Passageiros'),
(5012201, 'Transporte marítimo de longo curso - Carga'),
(5012202, 'Transporte marítimo de longo curso - Passageiros'),
(5021101, 'Transporte por navegação interior de carga'),
(5021102, 'Transporte por navegação interior de carga'),
(5022001, 'Transporte por navegação interior de passageiros em linhas regulares'),
(5022002, 'Transporte por navegação interior de passageiros em linhas regulares'),
(5030101, 'Navegação de apoio marítimo'),
(5030102, 'Navegação de apoio portuário'),
(5030103, 'Serviço de rebocadores e empurradores'),
(5091201, 'Transporte por navegação de travessia'),
(5091202, 'Transporte por navegação de travessia'),
(5099801, 'Transporte aquaviário para passeios turísticos'),
(5099899, 'Outros transportes aquaviários não especificados anteriormente'),
(5111100, 'Transporte aéreo de passageiros regular'),
(5112901, 'Serviço de táxi aéreo e locação de aeronaves com tripulação'),
(5112999, 'Outros serviços de transporte aéreo de passageiros não regular'),
(5120000, 'Transporte aéreo de carga'),
(5130700, 'Transporte espacial'),
(5211701, 'Armazéns gerais - emissão de warrant'),
(5211702, 'Guarda-móveis'),
(5211799, 'Depósitos de mercadorias para terceiros'),
(5212500, 'Carga e descarga'),
(5221400, 'Concessionárias de rodovias'),
(5222200, 'Terminais rodoviários e ferroviários'),
(5223100, 'Estacionamento de veículos'),
(5229001, 'Serviços de apoio ao transporte por táxi'),
(5229002, 'Serviços de reboque de veículos'),
(5229099, 'Outras atividades auxiliares dos transportes terrestres não especificadas anteriormente'),
(5231101, 'Administração da infraestrutura portuária'),
(5231102, 'Atividades do Operador Portuário'),
(5231103, 'Gestão de terminais aquaviários'),
(5232000, 'Atividades de agenciamento marítimo'),
(5239701, 'Serviços de praticagem'),
(5239799, 'Atividades auxiliares dos transportes aquaviários não especificadas anteriormente'),
(5240101, 'Operação dos aeroportos e campos de aterrissagem'),
(5240199, 'Atividades auxiliares dos transportes aéreos'),
(5250801, 'Comissaria de despachos'),
(5250802, 'Atividades de despachantes aduaneiros'),
(5250803, 'Agenciamento de cargas'),
(5250804, 'Organização logística do transporte de carga'),
(5250805, 'Operador de transporte multimodal - OTM'),
(5310501, 'Atividades do Correio Nacional'),
(5310502, 'Atividades de franqueadas e permissionárias do Correio Nacional'),
(5320201, 'Serviços de malote não realizados pelo Correio Nacional'),
(5320202, 'Serviços de entrega rápida'),
(5510801, 'Hotéis'),
(5510802, 'Apart-hotéis'),
(5510803, 'Motéis'),
(5590601, 'Albergues'),
(5590602, 'Campings'),
(5590603, 'Pensões (alojamento)'),
(5590699, 'Outros alojamentos não especificados anteriormente'),
(5611201, 'Restaurantes e similares'),
(5611202, 'Bares e outros estabelecimentos especializados em servir bebidas'),
(5611203, 'Lanchonetes'),
(5611204, 'Bares e outros estabelecimentos especializados em servir bebidas'),
(5611205, 'Bares e outros estabelecimentos especializados em servir bebidas'),
(5612100, 'Serviços ambulantes de alimentação'),
(5620101, 'Fornecimento de alimentos preparados preponderantemente para empresas'),
(5620102, 'Serviços de alimentação para eventos e recepções - bufê'),
(5620103, 'Cantinas - serviços de alimentação privativos'),
(5620104, 'Fornecimento de alimentos preparados preponderantemente para consumo domiciliar'),
(5811500, 'Edição de livros'),
(5812301, 'Edição de jornais diários'),
(5812302, 'Edição de jornais não diários'),
(5813100, 'Edição de revistas'),
(5819100, 'Edição de cadastros'),
(5821200, 'Edição integrada à impressão de livros'),
(5822101, 'Edição integrada à impressão de jornais diários'),
(5822102, 'Edição integrada à impressão de jornais não diários'),
(5823900, 'Edição integrada à impressão de revistas'),
(5829800, 'Edição integrada à impressão de cadastros'),
(5911101, 'Estúdios cinematográficos'),
(5911102, 'Produção de filmes para publicidade'),
(5911199, 'Atividades de produção cinematográfica'),
(5912001, 'Serviços de dublagem'),
(5912002, 'Serviços de mixagem sonora em produção audiovisual'),
(5912099, 'Atividades de pós-produção cinematográfica'),
(5913800, 'Distribuição cinematográfica'),
(5914600, 'Atividades de exibição cinematográfica'),
(5920100, 'Atividades de gravação de som e de edição de música'),
(6010100, 'Atividades de rádio'),
(6021700, 'Atividades de televisão aberta'),
(6022501, 'Programadoras'),
(6022502, 'Atividades relacionadas à televisão por assinatura'),
(6110801, 'Serviços de telefonia fixa comutada - STFC'),
(6110802, 'Serviços de redes de transporte de telecomunicações - SRTT'),
(6110803, 'Serviços de comunicação multimídia - SCM'),
(6110899, 'Serviços de telecomunicações por fio não especificados anteriormente'),
(6120501, 'Telefonia móvel celular'),
(6120502, 'Serviço móvel especializado - SME'),
(6120599, 'Serviços de telecomunicações sem fio não especificados anteriormente'),
(6130200, 'Telecomunicações por satélite'),
(6141800, 'Operadoras de televisão por assinatura por cabo'),
(6142600, 'Operadoras de televisão por assinatura por micro-ondas'),
(6143400, 'Operadoras de televisão por assinatura por satélite'),
(6190601, 'Provedores de acesso às redes de comunicações'),
(6190602, 'Provedores de voz sobre protocolo Internet - VOIP'),
(6190699, 'Outras atividades de telecomunicações não especificadas anteriormente'),
(6201501, 'Desenvolvimento de programas de computador sob encomenda'),
(6201502, 'Web desing'),
(6202300, 'Desenvolvimento e licenciamento de programas de computador customizáveis'),
(6203100, 'Desenvolvimento e licenciamento de programas de computador não customizáveis'),
(6204000, 'Consultoria em tecnologia da informação'),
(6209100, 'Suporte técnico'),
(6311900, 'Tratamento de dados'),
(6319400, 'Portais'),
(6391700, 'Agências de notícias'),
(6399200, 'Outras atividades de prestação de serviços de informação não especificadas anteriormente'),
(6410700, 'Banco Central'),
(6421200, 'Bancos comerciais'),
(6422100, 'Bancos múltiplos'),
(6423900, 'Caixas econômicas'),
(6424701, 'Bancos cooperativos'),
(6424702, 'Cooperativas centrais de crédito'),
(6424703, 'Cooperativas de crédito mútuo'),
(6424704, 'Cooperativas de crédito rural'),
(6431000, 'Bancos múltiplos'),
(6432800, 'Bancos de investimento'),
(6433600, 'Bancos de desenvolvimento'),
(6434400, 'Agências de fomento'),
(6435201, 'Sociedades de crédito imobiliário'),
(6435202, 'Associações de poupança e empréstimo'),
(6435203, 'Companhias hipotecárias'),
(6436100, 'Sociedades de crédito'),
(6437900, 'Sociedades de crédito ao microempreendedor'),
(6438701, 'Bancos de câmbio'),
(6438799, 'Outras instituições de intermediação não monetária não especificadas anteriormente'),
(6440900, 'Arrendamento mercantil'),
(6450600, 'Sociedades de capitalização'),
(6461100, 'Holdings de instituições financeiras'),
(6462000, 'Holdings de instituições não financeiras'),
(6463800, 'Outras sociedades de participação'),
(6470101, 'Fundos de investimento'),
(6470102, 'Fundos de investimento previdenciários'),
(6470103, 'Fundos de investimento imobiliários'),
(6491300, 'Sociedades de fomento mercantil - factoring'),
(6492100, 'Securitização de créditos'),
(6493000, 'Administração de consórcios para aquisição de bens e direitos'),
(6499901, 'Clubes de investimento'),
(6499902, 'Sociedades de investimento'),
(6499903, 'Fundo garantidor de crédito'),
(6499904, 'Caixas de financiamento de corporações'),
(6499905, 'Concessão de crédito pelas OSCIP'),
(6499999, 'Outras atividades de serviços financeiros não especificadas anteriormente'),
(6511101, 'Sociedade seguradora de seguros vida'),
(6511102, 'Planos de auxílio-funeral'),
(6512000, 'Seguros não-vida'),
(6520100, 'Sociedade seguradora de seguros-saúde'),
(6530800, 'Resseguros'),
(6541300, 'Previdência complementar fechada'),
(6542100, 'Previdência complementar aberta'),
(6550200, 'Planos de saúde'),
(6611801, 'Bolsa de valores'),
(6611802, 'Bolsa de mercadorias'),
(6611803, 'Bolsa de mercadorias e futuros'),
(6611804, 'Administração de mercados de balcão organizados'),
(6612601, 'Corretoras de títulos e valores mobiliários'),
(6612602, 'Distribuidoras de títulos e valores mobiliários'),
(6612603, 'Corretoras de câmbio'),
(6612604, 'Corretoras de contratos de mercadorias'),
(6612605, 'Agentes de investimentos em aplicações financeiras'),
(6613400, 'Administração de cartões de crédito'),
(6619301, 'Serviços de liquidação e custódia'),
(6619302, 'Correspondentes de instituições financeiras'),
(6619303, 'Representações de bancos estrangeiros'),
(6619304, 'Caixas eletrônicos'),
(6619305, 'Operadoras de cartões de débito'),
(6619399, 'Outras atividades auxiliares dos serviços financeiros não especificadas anteriormente'),
(6621501, 'Peritos e avaliadores de seguros'),
(6621502, 'Auditoria e consultoria atuarial'),
(6622300, 'Corretores e agentes de seguros'),
(6629100, 'Atividades auxiliares dos seguros'),
(6630400, 'Atividades de administração de fundos por contrato ou comissão'),
(6810201, 'Compra e venda de imóveis próprios'),
(6810202, 'Aluguel de imóveis próprios'),
(6810203, 'Loteamento de imóveis próprios'),
(6821801, 'Corretagem na compra e venda e avaliação de imóveis'),
(6821802, 'Corretagem no aluguel de imóveis'),
(6822600, 'Gestão e administração da propriedade imobiliária'),
(6911701, 'Serviços advocatícios'),
(6911702, 'Atividades auxiliares da justiça'),
(6911703, 'Agente de propriedade industrial'),
(6912500, 'Cartórios'),
(6920601, 'Atividades de contabilidade'),
(6920602, 'Atividades de consultoria e auditoria contábil e tributária'),
(7020400, 'Atividades de consultoria em gestão empresarial'),
(7111100, 'Serviços de arquitetura'),
(7112000, 'Serviços de engenharia'),
(7119701, 'Serviços de cartografia'),
(7119702, 'Atividades de estudos geológicos'),
(7119703, 'Serviços de desenho técnico relacionados à arquitetura e engenharia'),
(7119704, 'Serviços de perícia técnica relacionados à segurança do trabalho'),
(7119799, 'Atividades técnicas relacionadas à engenharia e arquitetura não especificadas anteriormente'),
(7120100, 'Testes e análises técnicas'),
(7210000, 'Pesquisa e desenvolvimento experimental em ciências físicas e naturais'),
(7220700, 'Pesquisa e desenvolvimento experimental em ciências sociais e humanas'),
(7311400, 'Agências de publicidade'),
(7312200, 'Agenciamento de espaços para publicidade'),
(7319001, 'Criação de estandes para feiras e exposições'),
(7319002, 'Promoção de vendas'),
(7319003, 'Marketing direto'),
(7319004, 'Consultoria em publicidade'),
(7319099, 'Outras atividades de publicidade não especificadas anteriormente'),
(7320300, 'Pesquisas de mercado e de opinião pública'),
(7410202, 'Design de interiores'),
(7410203, 'Desing de produto'),
(7410299, 'Atividades de desing não especificadas anteriormente'),
(7420001, 'Atividades de produção de fotografias'),
(7420002, 'Atividades de produção de fotografias aéreas e submarinas'),
(7420003, 'Laboratórios fotográficos'),
(7420004, 'Filmagem de festas e eventos'),
(7420005, 'Serviços de microfilmagem'),
(7490101, 'Serviços de tradução'),
(7490102, 'Escafandria e mergulho'),
(7490103, 'Serviços de agronomia e de consultoria às atividades agrícolas e pecuárias'),
(7490104, 'Atividades de intermediação e agenciamento de serviços e negócios em geral'),
(7490105, 'Agenciamento de profissionais para atividades esportivas'),
(7490199, 'Outras atividades profissionais'),
(7500100, 'Atividades veterinárias'),
(7711000, 'Locação de automóveis sem condutor'),
(7719501, 'Locação de embarcações sem tripulação'),
(7719502, 'Locação de aeronaves sem tripulação'),
(7719599, 'Locação de outros meios de transporte não especificados anteriormente'),
(7721700, 'Aluguel de equipamentos recreativos e esportivos'),
(7722500, 'Aluguel de fitas de vídeo'),
(7723300, 'Aluguel de objetos do vestuário'),
(7729201, 'Aluguel de aparelhos de jogos eletrônicos'),
(7729202, 'Aluguel de móveis'),
(7729203, 'Aluguel de material médico'),
(7729299, 'Aluguel de outros objetos pessoais e domésticos não especificados anteriormente'),
(7731400, 'Aluguel de máquinas e equipamentos agrícolas sem operador'),
(7732201, 'Aluguel de máquinas e equipamentos para construção sem operador'),
(7732202, 'Aluguel de andaimes'),
(7733100, 'Aluguel de máquinas e equipamentos para escritório'),
(7739001, 'Aluguel de máquinas e equipamentos para extração de minérios e petróleo'),
(7739002, 'Aluguel de equipamentos científicos'),
(7739003, 'Aluguel de palcos'),
(7739099, 'Aluguel de outras máquinas e equipamentos comerciais e industriais não especificados anteriormente'),
(7740300, 'Gestão de ativos intangíveis não financeiros'),
(7810800, 'Seleção e agenciamento de mão de obra'),
(7820500, 'Locação de mão de obra temporária'),
(7830200, 'Fornecimento e gestão de recursos humanos para terceiros'),
(7911200, 'Agências de viagens'),
(7912100, 'Operadores turísticos'),
(7990200, 'Serviços de reservas e outros serviços de turismo não especificados anteriormente'),
(8011101, 'Atividades de vigilância e segurança privada'),
(8011102, 'Serviços de adestramento de cães de guarda'),
(8012900, 'Atividades de transporte de valores'),
(8020001, 'Atividades de monitoramento de sistemas de segurança eletrônico'),
(8020002, 'Outras atividades de serviços de segurança'),
(8030700, 'Atividades de investigação particular'),
(8111700, 'Serviços combinados para apoio a edifícios'),
(8112500, 'Condomínios prediais'),
(8121400, 'Limpeza em prédios e em domicílios'),
(8122200, 'Imunização e controle de pragas urbanas'),
(8129000, 'Atividades de limpeza não especificadas anteriormente'),
(8130300, 'Atividades paisagísticas'),
(8211300, 'Serviços combinados de escritório e apoio administrativo'),
(8219901, 'Fotocópias'),
(8219999, 'Preparação de documentos e serviços especializados de apoio administrativo não especificados anteriormente'),
(8220200, 'Atividades de teleatendimento'),
(8230001, 'Serviços de organização de feiras'),
(8230002, 'Casas de festas e eventos'),
(8291100, 'Atividades de cobrança e informações cadastrais'),
(8292000, 'Envasamento e empacotamento sob contrato'),
(8299701, 'Medição de consumo de energia elétrica'),
(8299702, 'Emissão de vales-alimentação'),
(8299703, 'Serviços de gravação de carimbos'),
(8299704, 'Leiloeiros independentes'),
(8299705, 'Serviços de levantamento de fundos sob contrato'),
(8299706, 'Casas lotéricas'),
(8299707, 'Salas de acesso à Internet'),
(8299799, 'Outras atividades de serviços prestados principalmente às empresas não especificadas anteriormente'),
(8411600, 'Administração pública em geral'),
(8412400, 'Regulação das atividades de saúde'),
(8413200, 'Regulação das atividades econômicas'),
(8421300, 'Relações exteriores'),
(8422100, 'Defesa'),
(8423000, 'Justiça'),
(8424800, 'Segurança e ordem pública'),
(8425600, 'Defesa Civil'),
(8430200, 'Seguridade social obrigatória'),
(8511200, 'Educação infantil - creche'),
(8512100, 'Educação infantil - pré-escola'),
(8513900, 'Ensino fundamental'),
(8520100, 'Ensino médio'),
(8531700, 'Educação superior - graduação'),
(8532500, 'Educação superior - graduação e pós-graduação'),
(8533300, 'Educação superior - pós-graduação e extensão'),
(8541400, 'Educação profissional de nível técnico'),
(8542200, 'Educação profissional de nível tecnológico'),
(8550301, 'Administração de caixas escolares'),
(8550302, 'Atividades de apoio à educação'),
(8591100, 'Ensino de esportes'),
(8592901, 'Ensino de dança'),
(8592902, 'Ensino de artes cênicas'),
(8592903, 'Ensino de música'),
(8592999, 'Ensino de arte e cultura não especificado anteriormente'),
(8593700, 'Ensino de idiomas'),
(8599601, 'Formação de condutores'),
(8599602, 'Cursos de pilotagem'),
(8599603, 'Treinamento em informática'),
(8599604, 'Treinamento em desenvolvimento profissional e gerencial'),
(8599605, 'Cursos preparatórios para concursos'),
(8599699, 'Outras atividades de ensino não especificadas anteriormente'),
(8610101, 'Atividades de atendimento hospitalar'),
(8610102, 'Atividades de atendimento em pronto-socorro e unidades hospitalares para atendimento a urgências'),
(8621601, 'UTI móvel'),
(8621602, 'Serviços móveis de atendimento a urgências'),
(8622400, 'Serviços de remoção de pacientes'),
(8630501, 'Atividade médica ambulatorial com recursos para realização de procedimentos cirúrgicos'),
(8630502, 'Atividade médica ambulatorial com recursos para realização de exames complementares'),
(8630503, 'Atividade médica ambulatorial restrita a consultas'),
(8630504, 'Atividade odontológica'),
(8630506, 'Serviços de vacinação e imunização humana'),
(8630507, 'Atividades de reprodução humana assistida'),
(8630599, 'Atividades de atenção ambulatorial não especificadas anteriormente'),
(8640201, 'Laboratórios de anatomia patológica e citológica'),
(8640202, 'Laboratórios clínicos'),
(8640203, 'Serviços de diálise e nefrologia'),
(8640204, 'Serviços de tomografia'),
(8640205, 'Serviços de diagnóstico por imagem com uso de radiação ionizante'),
(8640206, 'Serviços de ressonância magnética'),
(8640207, 'Serviços de diagnóstico por imagem sem uso de radiação ionizante'),
(8640208, 'Serviços de diagnóstico por registro gráfico - ECG'),
(8640209, 'Serviços de diagnóstico por métodos ópticos - endoscopia e outros exames análogos'),
(8640210, 'Serviços de quimioterapia'),
(8640211, 'Serviços de radioterapia'),
(8640212, 'Serviços de hemoterapia'),
(8640213, 'Serviços de litotripsia'),
(8640214, 'Serviços de bancos de células e tecidos humanos'),
(8640299, 'Atividades de serviços de complementação diagnóstica e terapêutica não especificadas anteriormente'),
(8650001, 'Atividades de enfermagem'),
(8650002, 'Atividades de profissionais da nutrição'),
(8650003, 'Atividades de psicologia e psicanálise'),
(8650004, 'Atividades de fisioterapia'),
(8650005, 'Atividades de terapia ocupacional'),
(8650006, 'Atividades de fonoaudiologia'),
(8650007, 'Atividades de terapia de nutrição enteral e parenteral'),
(8650099, 'Atividades de profissionais da área de saúde não especificadas anteriormente'),
(8660700, 'Atividades de apoio à gestão de saúde'),
(8690901, 'Atividades de práticas integrativas e complementares em saúde humana'),
(8690902, 'Atividades de bancos de leite humano'),
(8690903, 'Atividades de acupuntura'),
(8690904, 'Atividades de podologia'),
(8690999, 'Outras atividades de atenção à saúde humana não especificadas anteriormente'),
(8711501, 'Clínicas e residências geriátricas'),
(8711502, 'Instituições de longa permanência para idosos'),
(8711503, 'Atividades de assistência a deficientes físicos'),
(8711504, 'Centros de apoio a pacientes com câncer e com AIDS'),
(8711505, 'Condomínios residenciais para idosos'),
(8712300, 'Atividades de fornecimento de infraestrutura de apoio e assistência a paciente no domicílio'),
(8720401, 'Atividades de centros de assistência psicossocial'),
(8720499, 'Atividades de assistência psicossocial e à saúde a portadores de distúrbios psíquicos'),
(8730101, 'Orfanatos'),
(8730102, 'Albergues assistenciais'),
(8730199, 'Atividades de assistência social prestadas em residências coletivas e particulares não especificadas anteriormente'),
(8800600, 'Serviços de assistência social sem alojamento'),
(9001901, 'Produção teatral'),
(9001902, 'Produção musical'),
(9001903, 'Produção de espetáculos de dança'),
(9001904, 'Produção de espetáculos circenses'),
(9001905, 'Produção de espetáculos de rodeios'),
(9001906, 'Atividades de sonorização e de iluminação'),
(9001999, 'Artes cênicas'),
(9002701, 'Atividades de artistas plásticos'),
(9002702, 'Restauração de obras de arte'),
(9003500, 'Gestão de espaços para artes cênicas'),
(9101500, 'Atividades de bibliotecas e arquivos'),
(9102301, 'Atividades de museus e de exploração de lugares e prédios históricos e atrações similares'),
(9102302, 'Restauração e conservação de lugares e prédios históricos'),
(9103100, 'Atividades de jardins botânicos'),
(9200301, 'Casas de bingo'),
(9200302, 'Exploração de apostas em corridas de cavalos'),
(9200399, 'Exploração de jogos de azar e apostas não especificados anteriormente'),
(9311500, 'Gestão de instalações de esportes'),
(9312300, 'Clubes sociais'),
(9313100, 'Atividades de condicionamento físico'),
(9319101, 'Produção e promoção de eventos esportivos'),
(9319199, 'Outras atividades esportivas não especificadas anteriormente'),
(9321200, 'Parques de diversão e parques temáticos'),
(9329801, 'Discotecas'),
(9329802, 'Exploração de boliches'),
(9329803, 'Exploração de jogos de sinuca'),
(9329804, 'Exploração de jogos eletrônicos recreativos'),
(9329899, 'Outras atividades de recreação e lazer não especificadas anteriormente'),
(9411100, 'Atividades de organizações associativas patronais e empresariais'),
(9412001, 'Atividades de fiscalização profissional'),
(9412099, 'Outras atividades associativas profissionais'),
(9420100, 'Atividades de organizações sindicais'),
(9430800, 'Atividades de associações de defesa de direitos sociais'),
(9491000, 'Atividades de organizações religiosas ou filosóficas'),
(9492800, 'Atividades de organizações políticas'),
(9493600, 'Atividades de organizações associativas ligadas à cultura e à arte'),
(9499500, 'Atividades associativas não especificadas anteriormente'),
(9511800, 'Reparação e manutenção de computadores e de equipamentos periféricos'),
(9512600, 'Reparação e manutenção de equipamentos de comunicação'),
(9521500, 'Reparação e manutenção de equipamentos eletroeletrônicos de uso pessoal e doméstico'),
(9529101, 'Reparação de calçados'),
(9529102, 'Chaveiros'),
(9529103, 'Reparação de relógios'),
(9529104, 'Reparação de bicicletas'),
(9529105, 'Reparação de artigos do mobiliário'),
(9529106, 'Reparação de jóias'),
(9529199, 'Reparação e manutenção de outros objetos e equipamentos pessoais e domésticos não especificados anteriormente'),
(9601701, 'Lavanderias'),
(9601702, 'Tinturarias'),
(9601703, 'Toalheiros'),
(9602501, 'Cabeleireiros'),
(9602502, 'Atividades de estética e outros serviços de cuidados com a beleza'),
(9603301, 'Gestão e manutenção de cemitérios'),
(9603302, 'Serviços de cremação'),
(9603303, 'Serviços de sepultamento'),
(9603304, 'Serviços de funerárias'),
(9603305, 'Serviços de somatoconservação'),
(9603399, 'Atividades funerárias e serviços relacionados não especificados anteriormente'),
(9609202, 'Agências matrimoniais'),
(9609204, 'Exploração de máquinas de serviços pessoais acionadas por moeda'),
(9609205, 'Atividades de sauna e banhos'),
(9609206, 'Serviços de tatuagem e colocação de piercing'),
(9609207, 'Alojamento de animais domésticos'),
(9609208, 'Higiene e embelezamento de animais domésticos'),
(9609299, 'Outras atividades de serviços pessoais não especificadas anteriormente'),
(9700500, 'Serviços domésticos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cnae_secundario`
--

DROP TABLE IF EXISTS `cnae_secundario`;
CREATE TABLE IF NOT EXISTS `cnae_secundario` (
  `idCNAE_Secundario` int UNSIGNED NOT NULL,
  `CNAE_Secundario` varchar(45) NOT NULL,
  PRIMARY KEY (`idCNAE_Secundario`),
  UNIQUE KEY `idCNAE_Secundario_UNIQUE` (`idCNAE_Secundario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoesnfe`
--

DROP TABLE IF EXISTS `configuracoesnfe`;
CREATE TABLE IF NOT EXISTS `configuracoesnfe` (
  `id_configuracao` int NOT NULL AUTO_INCREMENT,
  `chave` varchar(50) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_configuracao`,`idEmpresa`),
  UNIQUE KEY `chave` (`chave`),
  KEY `fk_configuracoesnfe_empresa1_idx` (`idEmpresa`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `configuracoesnfe`
--

INSERT INTO `configuracoesnfe` (`id_configuracao`, `chave`, `valor`, `descricao`, `idEmpresa`) VALUES
(15, 'empresa.estado', 'DF', 'Estado de emissão', 27),
(14, 'empresa.senhaCertificado', '123456', 'Senha do certificado digital', 27),
(13, 'empresa.caminhoCertificado', 'C:\\Users\\I5 9400F\\Desktop\\Pasta unica\\OPTICA OPTIVISUS LTDA_05657330000178.pfx', 'Caminho para o certificado digital', 27),
(16, 'empresa.ambiente', 'HOMOLOGACAO', 'Ambiente de emissão (PRODUCAO ou HOMOLOGACAO)', 27);

-- --------------------------------------------------------

--
-- Estrutura para tabela `confins_estadual`
--

DROP TABLE IF EXISTS `confins_estadual`;
CREATE TABLE IF NOT EXISTS `confins_estadual` (
  `idCONFINS` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `aliquota` decimal(10,2) DEFAULT NULL,
  `idCSOSN` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idCONFINS`),
  UNIQUE KEY `idCONFINS_UNIQUE` (`idCONFINS`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`),
  KEY `fk_CONFINS_Estadual_CSOSN_CONFINS1_idx` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

DROP TABLE IF EXISTS `contato`;
CREATE TABLE IF NOT EXISTS `contato` (
  `idContato` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Telefone` varchar(255) NOT NULL,
  `Telefone2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idContato`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `Telefone_UNIQUE` (`Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `contato`
--

INSERT INTO `contato` (`idContato`, `Email`, `Telefone`, `Telefone2`) VALUES
(86, 'opticaoptivisus@hotmail.com', '6133358282', '6133358282'),
(87, 'silvana.sara.dapaz@ltecno.com.br', '(84) 3799-2068', '(84) 98869-2352'),
(88, 'manoel-moraes95@idesc.com.br', '(96) 2670-3029', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `csosn_confins`
--

DROP TABLE IF EXISTS `csosn_confins`;
CREATE TABLE IF NOT EXISTS `csosn_confins` (
  `idCSOSN` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCSOSN`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `csosn_icms`
--

DROP TABLE IF EXISTS `csosn_icms`;
CREATE TABLE IF NOT EXISTS `csosn_icms` (
  `idCSOSN` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCSOSN`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `csosn_ipi`
--

DROP TABLE IF EXISTS `csosn_ipi`;
CREATE TABLE IF NOT EXISTS `csosn_ipi` (
  `idCSOSN` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCSOSN`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `csosn_pis`
--

DROP TABLE IF EXISTS `csosn_pis`;
CREATE TABLE IF NOT EXISTS `csosn_pis` (
  `idCSOSN` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `idEmpresa` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(255) NOT NULL,
  `Razao_Social` varchar(255) NOT NULL,
  `Nome_Fantasia` varchar(255) DEFAULT NULL,
  `Regime_Tributario` varchar(255) DEFAULT NULL,
  `Inscricao_Estadual` varchar(255) DEFAULT NULL,
  `Indicador_IE` varchar(255) DEFAULT NULL,
  `idContato` int UNSIGNED NOT NULL,
  `idEndereco` int UNSIGNED NOT NULL,
  `idCNAE` bigint DEFAULT NULL,
  `Data_Cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data_Modificacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  UNIQUE KEY `idEmpresa_UNIQUE` (`idEmpresa`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`),
  KEY `fk_Cadastro_Empresa_Contato1_idx` (`idContato`),
  KEY `fk_Cadastro_Empresa_Endereço1_idx` (`idEndereco`),
  KEY `fk_Cadastro_Empresa_CNAE1_idx` (`idCNAE`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `CNPJ`, `Razao_Social`, `Nome_Fantasia`, `Regime_Tributario`, `Inscricao_Estadual`, `Indicador_IE`, `idContato`, `idEndereco`, `idCNAE`, `Data_Cadastro`, `Data_Modificacao`, `senha`) VALUES
(28, '05.657.330/0001-78', 'Optica Optivisus LTDA', 'Optivisus', 'Simples Nacional', '19821892981217', 'Normal', 86, 75, NULL, '2025-01-26 15:04:40', '2025-01-26 15:04:40', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa_cnaesecundario`
--

DROP TABLE IF EXISTS `empresa_cnaesecundario`;
CREATE TABLE IF NOT EXISTS `empresa_cnaesecundario` (
  `idEmpresa_CnaeSecundario` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idEmpresa` int UNSIGNED DEFAULT NULL,
  `idCNAE_Secundario` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idEmpresa_CnaeSecundario`),
  UNIQUE KEY `idEmpresa_CnaeSecundario_UNIQUE` (`idEmpresa_CnaeSecundario`),
  KEY `fk_Empresa_CnaeSecundario_Cadastro_Empresa1_idx` (`idEmpresa`),
  KEY `fk_Empresa_CnaeSecundario_CNAE_Secundario1_idx` (`idCNAE_Secundario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `idEndereco` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(255) NOT NULL,
  `Bairro` varchar(255) NOT NULL,
  `Numero` varchar(255) NOT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `CEP` varchar(255) NOT NULL,
  `UF` varchar(255) NOT NULL,
  `Municipio` varchar(255) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  UNIQUE KEY `idEndereço_UNIQUE` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `Logradouro`, `Bairro`, `Numero`, `Complemento`, `CEP`, `UF`, `Municipio`) VALUES
(75, 'Avenida Comercial Lote', 'São Sebastião', '1961', 'Ao lado do banco Itau', '73084-020', 'DF', 'Brasilia'),
(76, 'Rua São José', 'Nossa Senhora da Apresentação', '987', '', '59115-664', 'SP', 'Natal'),
(77, 'Avenida Rio Branco', 'Fonte Nova', '233', '', '68928-148', 'RJ', 'Rio de Janeiro ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enquadramento_legal`
--

DROP TABLE IF EXISTS `enquadramento_legal`;
CREATE TABLE IF NOT EXISTS `enquadramento_legal` (
  `idLegal` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLegal`),
  UNIQUE KEY `idLegal_UNIQUE` (`idLegal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE IF NOT EXISTS `estoque` (
  `idProduto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCategoria` int UNSIGNED DEFAULT NULL,
  `descricao` varchar(255) NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idestoque_UNIQUE` (`idProduto`),
  KEY `fk_estoque_Categoria1_idx` (`idCategoria`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

DROP TABLE IF EXISTS `exame`;
CREATE TABLE IF NOT EXISTS `exame` (
  `idExame` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCliente` int UNSIGNED NOT NULL,
  `id_Optometrista` int UNSIGNED NOT NULL,
  `data_exame` date NOT NULL,
  `tipo_exame` varchar(100) NOT NULL,
  `resultados` text,
  `observacoes` text,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idExame`),
  UNIQUE KEY `idExame_UNIQUE` (`idExame`),
  KEY `fk_Exame_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_Exame_Clientes1_idx` (`idCliente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `icms_estadual`
--

DROP TABLE IF EXISTS `icms_estadual`;
CREATE TABLE IF NOT EXISTS `icms_estadual` (
  `idICMS` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `aliquota` decimal(10,2) DEFAULT NULL,
  `Credito` decimal(10,2) DEFAULT NULL,
  `ICMS_ST_reducao` varchar(45) DEFAULT NULL,
  `idCSOSN` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idICMS`),
  UNIQUE KEY `idICMS_UNIQUE` (`idICMS`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`),
  KEY `fk_ICMS_Estadual_CSOSN1_idx` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `imposto`
--

DROP TABLE IF EXISTS `imposto`;
CREATE TABLE IF NOT EXISTS `imposto` (
  `idImposto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `Descricao` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idImposto`),
  UNIQUE KEY `idImposto_UNIQUE` (`idImposto`),
  KEY `fk_Imposto_Produto1_idx` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `impostos_estadual`
--

DROP TABLE IF EXISTS `impostos_estadual`;
CREATE TABLE IF NOT EXISTS `impostos_estadual` (
  `idImposto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCFOP` int UNSIGNED DEFAULT NULL,
  `idOrigem` int UNSIGNED DEFAULT NULL,
  `idICMS` int UNSIGNED DEFAULT NULL,
  `idPIS` int UNSIGNED DEFAULT NULL,
  `idCOFINS` int UNSIGNED DEFAULT NULL,
  `idIPI` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idImposto`),
  UNIQUE KEY `id_UNIQUE` (`idImposto`),
  UNIQUE KEY `idCFOP_UNIQUE` (`idCFOP`),
  UNIQUE KEY `idOrigem_UNIQUE` (`idOrigem`),
  UNIQUE KEY `idICMS_UNIQUE` (`idICMS`),
  UNIQUE KEY `idPIS_UNIQUE` (`idPIS`),
  UNIQUE KEY `idCOFINS_UNIQUE` (`idCOFINS`),
  UNIQUE KEY `idIPI_UNIQUE` (`idIPI`),
  KEY `fk_Impostos_Estadual_CFOP1_idx` (`idCFOP`),
  KEY `fk_Impostos_Estadual_Origem_Estadual1_idx` (`idOrigem`),
  KEY `fk_Impostos_Estadual_ICMS_Estadual1_idx` (`idICMS`),
  KEY `fk_Impostos_Estadual_PIS_Estadual1_idx` (`idPIS`),
  KEY `fk_Impostos_Estadual_CONFINS_Estadual1_idx` (`idCOFINS`),
  KEY `fk_Impostos_Estadual_IPI_Estadual1_idx` (`idIPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ipi_estadual`
--

DROP TABLE IF EXISTS `ipi_estadual`;
CREATE TABLE IF NOT EXISTS `ipi_estadual` (
  `idIPI` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `aliquota` decimal(10,2) DEFAULT NULL,
  `idCSOSN` int UNSIGNED DEFAULT NULL,
  `idLegal` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idIPI`),
  UNIQUE KEY `idIPI_UNIQUE` (`idIPI`),
  UNIQUE KEY `idLegal_UNIQUE` (`idLegal`),
  UNIQUE KEY `idCSOSN_UNIQUE` (`idCSOSN`),
  KEY `fk_IPI_Estadual_CSOSN_IPI1_idx` (`idCSOSN`),
  KEY `fk_IPI_Estadual_Enquadramento_Legal1_idx` (`idLegal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lentes`
--

DROP TABLE IF EXISTS `lentes`;
CREATE TABLE IF NOT EXISTS `lentes` (
  `id_lentes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `idTipo_Lente` int UNSIGNED NOT NULL,
  `idMaterial` int UNSIGNED NOT NULL,
  `idTratamento` int UNSIGNED NOT NULL,
  `indice_refracao` decimal(5,2) NOT NULL,
  `preco_custo` decimal(10,2) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `quantidade` int NOT NULL,
  `grau` decimal(4,2) NOT NULL,
  `eixo` int DEFAULT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_lentes`),
  UNIQUE KEY `id_lentes_UNIQUE` (`id_lentes`),
  KEY `fk_lentes_Tratamento1_idx` (`idTratamento`),
  KEY `fk_lentes_Material_Lente1_idx` (`idMaterial`),
  KEY `fk_lentes_tipo_lente1_idx` (`idTipo_Lente`),
  KEY `fk_lentes_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lentes_contato`
--

DROP TABLE IF EXISTS `lentes_contato`;
CREATE TABLE IF NOT EXISTS `lentes_contato` (
  `id_lentes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `idTipo_Lente` int UNSIGNED NOT NULL,
  `idMaterial` int UNSIGNED NOT NULL,
  `idTratamento` int UNSIGNED NOT NULL,
  `curva_base` decimal(5,2) NOT NULL,
  `diametro` decimal(5,2) NOT NULL,
  `preco_custo` decimal(10,2) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `quantidade` int NOT NULL,
  `grau` decimal(4,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_lentes`),
  UNIQUE KEY `id_lentes_UNIQUE` (`id_lentes`),
  KEY `fk_lentes_Tratamento1_idx` (`idTratamento`),
  KEY `fk_lentes_Material_Lente1_idx` (`idMaterial`),
  KEY `fk_lentes_tipo_lente1_idx` (`idTipo_Lente`),
  KEY `fk_lentes_contato_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `idlogin` bigint NOT NULL AUTO_INCREMENT,
  `login_usuario` varchar(255) NOT NULL,
  `login_senha` varchar(255) NOT NULL,
  `idtipos_login` int UNSIGNED NOT NULL,
  `idUsuario` int UNSIGNED NOT NULL,
  `Data_Cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data_Modificacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idlogin`),
  UNIQUE KEY `Login_Usuario_UNIQUE` (`login_usuario`),
  UNIQUE KEY `idlogin_UNIQUE` (`idlogin`),
  UNIQUE KEY `CPF_UNIQUE` (`idUsuario`),
  KEY `fk_login_tipos_login1_idx` (`idtipos_login`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`idlogin`, `login_usuario`, `login_senha`, `idtipos_login`, `idUsuario`, `Data_Cadastro`, `Data_Modificacao`, `idEmpresa`) VALUES
(1, 'ADMIN', '123', 1, 1, '2024-10-04 17:51:12', '2024-10-04 17:51:12', 28),
(2, 'Geraldo', '123', 3, 2, '2024-10-04 22:19:07', '2024-10-04 22:19:07', 28),
(3, 'Helena', '123', 2, 18, '2025-01-15 22:25:04', '2025-01-15 22:25:04', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome_Marca` varchar(45) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `idMarca_UNIQUE` (`idMarca`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome_Material` varchar(45) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idMaterial`),
  UNIQUE KEY `idMaterial_UNIQUE` (`idMaterial`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `material_lente`
--

DROP TABLE IF EXISTS `material_lente`;
CREATE TABLE IF NOT EXISTS `material_lente` (
  `idMaterial_Lente` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idMaterial_Lente`),
  UNIQUE KEY `idMaterial_Lente_UNIQUE` (`idMaterial_Lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `material_lente_contato`
--

DROP TABLE IF EXISTS `material_lente_contato`;
CREATE TABLE IF NOT EXISTS `material_lente_contato` (
  `idMaterial_Lente` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idMaterial_Lente`),
  UNIQUE KEY `idMaterial_Lente_UNIQUE` (`idMaterial_Lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes`
--

DROP TABLE IF EXISTS `movimentacoes`;
CREATE TABLE IF NOT EXISTS `movimentacoes` (
  `id_movimentacoes` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `idVenda` int DEFAULT NULL,
  `tipo_movimento` enum('Entrada','Saida') NOT NULL,
  `quantidade` int NOT NULL,
  `data_movimento` date NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_movimentacoes`),
  UNIQUE KEY `id_movimentacoes_UNIQUE` (`id_movimentacoes`),
  KEY `fk_movimentacoes_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `movimentacoes_caixa`
--

DROP TABLE IF EXISTS `movimentacoes_caixa`;
CREATE TABLE IF NOT EXISTS `movimentacoes_caixa` (
  `id_movimentacao` int NOT NULL AUTO_INCREMENT,
  `id_caixa` int NOT NULL,
  `data_movimentacao` datetime NOT NULL,
  `tipo` enum('entrada','saida') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `idVenda` int NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `id_caixa` (`id_caixa`),
  KEY `idVenda` (`idVenda`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota_detalhe`
--

DROP TABLE IF EXISTS `nota_detalhe`;
CREATE TABLE IF NOT EXISTS `nota_detalhe` (
  `idnota` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idnota`),
  UNIQUE KEY `idnota_detalhe_UNIQUE` (`idnota`),
  KEY `fk_nota_detalhe_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
CREATE TABLE IF NOT EXISTS `nota_fiscal` (
  `idnota` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idVenda` int UNSIGNED NOT NULL,
  `idCliente` int UNSIGNED NOT NULL,
  `numero_nota` varchar(255) NOT NULL,
  `data_emissao` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `observacoes` text,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idnota`),
  UNIQUE KEY `idnota_UNIQUE` (`idnota`),
  KEY `fk_nota_fiscal_Clientes1_idx` (`idCliente`),
  KEY `fk_nota_fiscal_Venda1_idx` (`idVenda`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `oculos`
--

DROP TABLE IF EXISTS `oculos`;
CREATE TABLE IF NOT EXISTS `oculos` (
  `idOculos` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idOculos`),
  UNIQUE KEY `idOculos_UNIQUE` (`idOculos`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `optometrista`
--

DROP TABLE IF EXISTS `optometrista`;
CREATE TABLE IF NOT EXISTS `optometrista` (
  `id_Optometrista` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `registro_profissional` varchar(255) NOT NULL,
  `idEndereco` int UNSIGNED NOT NULL,
  `idContato` int UNSIGNED NOT NULL,
  `Data_Cadastro` datetime(6) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_Optometrista`),
  UNIQUE KEY `idMedico_UNIQUE` (`id_Optometrista`),
  KEY `fk_Optometrista_endereco1_idx` (`idEndereco`),
  KEY `fk_Optometrista_contato1_idx` (`idContato`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `optometrista`
--

INSERT INTO `optometrista` (`id_Optometrista`, `Nome`, `registro_profissional`, `idEndereco`, `idContato`, `Data_Cadastro`, `idEmpresa`) VALUES
(6, 'Manoel Yuri Rafael Moraes', '46.291.170-6', 77, 88, '2025-01-28 21:34:08.732000', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
CREATE TABLE IF NOT EXISTS `ordem_servico` (
  `id_ordem` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCliente` int UNSIGNED NOT NULL,
  `id_Optometrista` int UNSIGNED NOT NULL,
  `id_Funcionario` int UNSIGNED NOT NULL,
  `id_Receita` int UNSIGNED NOT NULL,
  `idProduto` int UNSIGNED NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `data_entrega` datetime DEFAULT NULL,
  `tipo_servico` varchar(100) NOT NULL,
  `status_servico` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_entrada` decimal(10,2) DEFAULT NULL,
  `valor_restante` decimal(10,2) DEFAULT NULL,
  `observacoes` text,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ordem`),
  UNIQUE KEY `id_ordem_UNIQUE` (`id_ordem`),
  KEY `fk_ordem_servico_Clientes1_idx` (`idCliente`),
  KEY `fk_ordem_servico_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_ordem_servico_Receita_Exame1_idx` (`id_Receita`),
  KEY `fk_ordem_servico_Produto1_idx` (`idProduto`),
  KEY `fk_ordem_servico_Funcionarios1_idx` (`id_Funcionario`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=762542025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `origem_estadual`
--

DROP TABLE IF EXISTS `origem_estadual`;
CREATE TABLE IF NOT EXISTS `origem_estadual` (
  `idOrigem` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idOrigem`),
  UNIQUE KEY `idOrigem_UNIQUE` (`idOrigem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_detalhe`
--

DROP TABLE IF EXISTS `pedido_detalhe`;
CREATE TABLE IF NOT EXISTS `pedido_detalhe` (
  `idPedido_Registro` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `qntde` int DEFAULT NULL,
  `vlrUnitario` decimal(10,2) DEFAULT NULL,
  `vlrTotal` decimal(10,2) DEFAULT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idPedido_Registro`),
  UNIQUE KEY `idPedido_UNIQUE` (`idPedido_Registro`),
  KEY `fk_Pedido_detalhe_Produto1_idx` (`idProduto`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_registro`
--

DROP TABLE IF EXISTS `pedido_registro`;
CREATE TABLE IF NOT EXISTS `pedido_registro` (
  `idPedido_Registro` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCliente_Fisico` int NOT NULL,
  `idFuncionario` int UNSIGNED NOT NULL,
  `data` datetime NOT NULL,
  `vlr` decimal(10,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idPedido_Registro`),
  UNIQUE KEY `idPedido_Registro_UNIQUE` (`idPedido_Registro`),
  KEY `fk_Pedido_Registro_Funcionarios1_idx` (`idFuncionario`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
CREATE TABLE IF NOT EXISTS `pessoafisica` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) NOT NULL,
  `idCliente` int UNSIGNED NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PessoaFisica_Clientes` (`idCliente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pessoafisica`
--

INSERT INTO `pessoafisica` (`id`, `cpf`, `idCliente`, `idEmpresa`) VALUES
(7, '245.127.262-76', 27, 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
CREATE TABLE IF NOT EXISTS `pessoajuridica` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(255) NOT NULL,
  `cnpj` varchar(255) NOT NULL,
  `inscricao_estadual` varchar(255) NOT NULL,
  `inscricao_municipal` varchar(25) NOT NULL,
  `idCliente` int UNSIGNED NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  `inscricaoMunicipal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PessoaJuridica_Clientes` (`idCliente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pis_estadual`
--

DROP TABLE IF EXISTS `pis_estadual`;
CREATE TABLE IF NOT EXISTS `pis_estadual` (
  `idPIS` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `aliquota` decimal(10,2) DEFAULT NULL,
  `idCSOSN` int DEFAULT NULL,
  PRIMARY KEY (`idPIS`),
  UNIQUE KEY `idPIS_UNIQUE` (`idPIS`),
  KEY `fk_PIS_Estadual_CSOSN_PIS1_idx` (`idCSOSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nome_Produto` varchar(100) NOT NULL,
  `unidade` varchar(255) NOT NULL,
  `idCategoria` int UNSIGNED NOT NULL,
  `Preco` decimal(10,2) UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `Imagem` varchar(255) DEFAULT NULL,
  `Codigo_de_Barras` varchar(50) NOT NULL,
  `Observacoes` text,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idProduto_UNIQUE` (`idProduto`),
  UNIQUE KEY `Codigo_de_Barras_UNIQUE` (`Codigo_de_Barras`),
  KEY `fk_Produto_Categoria1_idx` (`idCategoria`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `Nome_Produto`, `unidade`, `idCategoria`, `Preco`, `data`, `Imagem`, `Codigo_de_Barras`, `Observacoes`, `idEmpresa`) VALUES
(6, 'Colirio', '1', 19, 20.00, '2025-02-05', '', '1289189721792981', 'Colirio Marca X', 28),
(7, 'Oculos RayBan', '1', 1, 100.00, '2025-02-05', '', '12319872912919', 'Oculos Preto', 28),
(8, 'Oculos RayBan', '1', 7, 2000.00, '2025-02-05', '', '1212142424112121214', 'Oculos Preto ', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `receita_exame`
--

DROP TABLE IF EXISTS `receita_exame`;
CREATE TABLE IF NOT EXISTS `receita_exame` (
  `idReceita` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idExame` int UNSIGNED NOT NULL,
  `id_Optometrista` int UNSIGNED NOT NULL,
  `id_Cliente` int UNSIGNED NOT NULL,
  `data_receita` date NOT NULL,
  `esfera_direito` varchar(10) DEFAULT NULL,
  `cilindro_direito` varchar(10) DEFAULT NULL,
  `eixo_direito` varchar(10) DEFAULT NULL,
  `dip_direito` varchar(10) DEFAULT NULL,
  `dnp_direito` varchar(10) DEFAULT NULL,
  `adicao_direito` varchar(10) DEFAULT NULL,
  `esfera_esquerdo` varchar(10) DEFAULT NULL,
  `cilindro_esquerdo` varchar(10) DEFAULT NULL,
  `eixo_esquerdo` varchar(10) DEFAULT NULL,
  `dip_esquerdo` varchar(10) DEFAULT NULL,
  `dnp_esquerdo` varchar(10) DEFAULT NULL,
  `adicao_esquerdo` varchar(10) DEFAULT NULL,
  `observacoes` text,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idReceita`),
  UNIQUE KEY `idReceita_UNIQUE` (`idReceita`),
  KEY `fk_Receita_Exame_Exame1_idx` (`idExame`),
  KEY `fk_Receita_Exame_Optometrista1_idx` (`id_Optometrista`),
  KEY `fk_Receita_Exame_Clientes1_idx` (`id_Cliente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `situacao`
--

DROP TABLE IF EXISTS `situacao`;
CREATE TABLE IF NOT EXISTS `situacao` (
  `idSituacao` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`idSituacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_login`
--

DROP TABLE IF EXISTS `tipos_login`;
CREATE TABLE IF NOT EXISTS `tipos_login` (
  `idtipos_login` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipos_login` varchar(255) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idtipos_login`),
  UNIQUE KEY `idtipos_login_UNIQUE` (`idtipos_login`),
  KEY `fk_tiposlogin_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipos_login`
--

INSERT INTO `tipos_login` (`idtipos_login`, `tipos_login`, `idEmpresa`) VALUES
(1, 'ADMIN', 28),
(2, 'Dono', 28),
(3, 'Funcionario', 28),
(4, 'Gerente', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_lente`
--

DROP TABLE IF EXISTS `tipo_lente`;
CREATE TABLE IF NOT EXISTS `tipo_lente` (
  `idtipo_lente` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idtipo_lente`),
  UNIQUE KEY `idtipo_lente_UNIQUE` (`idtipo_lente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_lente_contato`
--

DROP TABLE IF EXISTS `tipo_lente_contato`;
CREATE TABLE IF NOT EXISTS `tipo_lente_contato` (
  `idtipo_lente` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idtipo_lente`),
  UNIQUE KEY `idtipo_lente_UNIQUE` (`idtipo_lente`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
CREATE TABLE IF NOT EXISTS `tipo_pagamento` (
  `idPagamento` int NOT NULL AUTO_INCREMENT,
  `Tipo_Pagamento` varchar(45) NOT NULL,
  PRIMARY KEY (`idPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipo_pagamento`
--

INSERT INTO `tipo_pagamento` (`idPagamento`, `Tipo_Pagamento`) VALUES
(1, 'Crédito'),
(2, 'Dinheiro'),
(3, 'Pix'),
(4, 'Débito'),
(5, 'Cheque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `token_reset_senha`
--

DROP TABLE IF EXISTS `token_reset_senha`;
CREATE TABLE IF NOT EXISTS `token_reset_senha` (
  `Email` varchar(120) NOT NULL,
  `Token` varchar(120) NOT NULL,
  `Data_Expiracao` datetime NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Token_UNIQUE` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tratamento`
--

DROP TABLE IF EXISTS `tratamento`;
CREATE TABLE IF NOT EXISTS `tratamento` (
  `idTratamento` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idTratamento`),
  UNIQUE KEY `idTratamento_UNIQUE` (`idTratamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tratamento_contato`
--

DROP TABLE IF EXISTS `tratamento_contato`;
CREATE TABLE IF NOT EXISTS `tratamento_contato` (
  `idTratamento` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`idTratamento`),
  UNIQUE KEY `idTratamento_UNIQUE` (`idTratamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidade`
--

DROP TABLE IF EXISTS `unidade`;
CREATE TABLE IF NOT EXISTS `unidade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidade`
--

INSERT INTO `unidade` (`id`, `descricao`) VALUES
(1, 'UND');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `CPF` varchar(255) NOT NULL,
  `Nome_Completo` varchar(255) NOT NULL,
  `Data_Cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Data_Modificacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Nome_Completo_UNIQUE` (`Nome_Completo`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `CPF`, `Nome_Completo`, `Data_Cadastro`, `Data_Modificacao`, `idEmpresa`) VALUES
(1, '295.840.490-03', 'ADMIN', '2024-10-04 17:51:12', '2024-10-04 17:51:12', 28),
(2, '092.154.930-00', 'Geraldo Luis', '2024-10-04 22:19:07', '2024-10-04 22:19:07', 28),
(18, '492.774.131-15', 'Helena', '2025-01-15 19:25:04', '2025-01-15 19:25:04', 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `idVenda` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idFuncionario` int UNSIGNED NOT NULL,
  `idCliente` bigint NOT NULL,
  `idPagamento` int NOT NULL,
  `data` date NOT NULL,
  `vlrSugerido` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `totalVenda` decimal(10,2) NOT NULL,
  `parcela` varchar(255) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `recebeu` decimal(10,2) DEFAULT NULL,
  `restante` decimal(10,2) DEFAULT NULL,
  `vlrFinal` decimal(10,2) NOT NULL,
  `idCaixa` int NOT NULL,
  `vlrRecebido` decimal(10,2) DEFAULT NULL,
  `vlrRestante` decimal(10,2) DEFAULT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE KEY `idVenda_UNIQUE` (`idVenda`),
  UNIQUE KEY `idFuncionario_UNIQUE` (`idFuncionario`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  KEY `fk_Venda_Tipo_Pagamento1_idx` (`idPagamento`),
  KEY `fk_Venda_Clientes1_idx` (`idCliente`),
  KEY `fk_Venda_cadastro_funcionarios1_idx` (`idFuncionario`),
  KEY `fk_venda_caixa1_idx` (`idCaixa`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_itens`
--

DROP TABLE IF EXISTS `venda_itens`;
CREATE TABLE IF NOT EXISTS `venda_itens` (
  `idVenda` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProduto` int UNSIGNED NOT NULL,
  `quantidade` int UNSIGNED NOT NULL,
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `preco` decimal(10,2) UNSIGNED NOT NULL,
  `vlrTotal` decimal(10,2) NOT NULL,
  `idEmpresa` int UNSIGNED NOT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `fk_Venda_Itens_Produto1_idx` (`idProduto`),
  KEY `fk_Venda_Itens_Venda1_idx` (`idVenda`),
  KEY `fk_usuarios_empresa_idx` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_produto`
--

DROP TABLE IF EXISTS `venda_produto`;
CREATE TABLE IF NOT EXISTS `venda_produto` (
  `idVenda_Produto` int NOT NULL AUTO_INCREMENT,
  `idVenda` int NOT NULL,
  `idProduto` int NOT NULL,
  `idEstoque` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `vlPreco` decimal(10,2) NOT NULL,
  `vlCusto` decimal(10,2) NOT NULL,
  `dataAlteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVenda_Produto`),
  KEY `fk_venda_produto_venda` (`idVenda`),
  KEY `fk_venda_produto_produto` (`idProduto`),
  KEY `fk_venda_produto_estoque` (`idEstoque`),
  KEY `fk_venda_produto_empresa` (`idEmpresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda_produto_estorno`
--

DROP TABLE IF EXISTS `venda_produto_estorno`;
CREATE TABLE IF NOT EXISTS `venda_produto_estorno` (
  `idVenda_Produto_Estorno` int NOT NULL AUTO_INCREMENT,
  `idVenda` int NOT NULL,
  `idProduto` int NOT NULL,
  `idEstoque` int NOT NULL,
  `idEmpresa` int NOT NULL,
  `vlPreco` decimal(10,2) NOT NULL,
  `vlCusto` decimal(10,2) NOT NULL,
  `qtd` int NOT NULL,
  `nomeProduto` varchar(100) NOT NULL,
  `dataAlteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataCriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVenda_Produto_Estorno`),
  KEY `fk_venda_produto_estorno_venda` (`idVenda`),
  KEY `fk_venda_produto_estorno_produto` (`idProduto`),
  KEY `fk_venda_produto_estorno_estoque` (`idEstoque`),
  KEY `fk_venda_produto_estorno_empresa` (`idEmpresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamento_exame`
--
ALTER TABLE `agendamento_exame`
  ADD CONSTRAINT `fk_agendamento_exame_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `armacoes`
--
ALTER TABLE `armacoes`
  ADD CONSTRAINT `fk_armacoes_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Armacoes_Marca1` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`),
  ADD CONSTRAINT `fk_Armacoes_Material1` FOREIGN KEY (`idMaterial`) REFERENCES `material` (`idMaterial`),
  ADD CONSTRAINT `fk_Armacoes_Oculos1` FOREIGN KEY (`idOculos`) REFERENCES `oculos` (`idOculos`),
  ADD CONSTRAINT `fk_Armacoes_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_idEmpresa_Empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`);

--
-- Restrições para tabelas `cadastro_funcionarios`
--
ALTER TABLE `cadastro_funcionarios`
  ADD CONSTRAINT `fk_Funcionarios_cargo_funcionario1` FOREIGN KEY (`idFuncao`) REFERENCES `cargo_funcionario` (`idCargo_Funcionario`);

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_Clientes_contato` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idContato`),
  ADD CONSTRAINT `fk_clientes_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Clientes_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`);

--
-- Restrições para tabelas `confins_estadual`
--
ALTER TABLE `confins_estadual`
  ADD CONSTRAINT `fk_CONFINS_Estadual_CSOSN_CONFINS1` FOREIGN KEY (`idCSOSN`) REFERENCES `csosn_confins` (`idCSOSN`);

--
-- Restrições para tabelas `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_Cadastro_Empresa_Contato1` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idContato`),
  ADD CONSTRAINT `fk_Cadastro_Empresa_Endereço1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`);

--
-- Restrições para tabelas `empresa_cnaesecundario`
--
ALTER TABLE `empresa_cnaesecundario`
  ADD CONSTRAINT `fk_Empresa_CnaeSecundario_Cadastro_Empresa1` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`),
  ADD CONSTRAINT `fk_Empresa_CnaeSecundario_CNAE_Secundario1` FOREIGN KEY (`idCNAE_Secundario`) REFERENCES `cnae_secundario` (`idCNAE_Secundario`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `fk_estoque_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `fk_exame_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Exame_Optometrista1` FOREIGN KEY (`id_Optometrista`) REFERENCES `optometrista` (`id_Optometrista`);

--
-- Restrições para tabelas `icms_estadual`
--
ALTER TABLE `icms_estadual`
  ADD CONSTRAINT `fk_ICMS_Estadual_CSOSN1` FOREIGN KEY (`idCSOSN`) REFERENCES `csosn_icms` (`idCSOSN`);

--
-- Restrições para tabelas `imposto`
--
ALTER TABLE `imposto`
  ADD CONSTRAINT `fk_Imposto_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `impostos_estadual`
--
ALTER TABLE `impostos_estadual`
  ADD CONSTRAINT `fk_Impostos_Estadual_CFOP1` FOREIGN KEY (`idCFOP`) REFERENCES `cfop_estadual` (`idCFOP`),
  ADD CONSTRAINT `fk_Impostos_Estadual_CONFINS_Estadual1` FOREIGN KEY (`idCOFINS`) REFERENCES `confins_estadual` (`idCONFINS`),
  ADD CONSTRAINT `fk_Impostos_Estadual_ICMS_Estadual1` FOREIGN KEY (`idICMS`) REFERENCES `icms_estadual` (`idICMS`),
  ADD CONSTRAINT `fk_Impostos_Estadual_Imposto1` FOREIGN KEY (`idImposto`) REFERENCES `imposto` (`idImposto`),
  ADD CONSTRAINT `fk_Impostos_Estadual_IPI_Estadual1` FOREIGN KEY (`idIPI`) REFERENCES `ipi_estadual` (`idIPI`),
  ADD CONSTRAINT `fk_Impostos_Estadual_Origem_Estadual1` FOREIGN KEY (`idOrigem`) REFERENCES `origem_estadual` (`idOrigem`),
  ADD CONSTRAINT `fk_Impostos_Estadual_PIS_Estadual1` FOREIGN KEY (`idPIS`) REFERENCES `pis_estadual` (`idPIS`);

--
-- Restrições para tabelas `ipi_estadual`
--
ALTER TABLE `ipi_estadual`
  ADD CONSTRAINT `fk_IPI_Estadual_CSOSN_IPI1` FOREIGN KEY (`idCSOSN`) REFERENCES `csosn_ipi` (`idCSOSN`),
  ADD CONSTRAINT `fk_IPI_Estadual_Enquadramento_Legal1` FOREIGN KEY (`idLegal`) REFERENCES `enquadramento_legal` (`idLegal`);

--
-- Restrições para tabelas `lentes`
--
ALTER TABLE `lentes`
  ADD CONSTRAINT `fk_lentes_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lentes_Material_Lente1` FOREIGN KEY (`idMaterial`) REFERENCES `material_lente` (`idMaterial_Lente`),
  ADD CONSTRAINT `fk_lentes_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_lentes_tipo_lente1` FOREIGN KEY (`idTipo_Lente`) REFERENCES `tipo_lente` (`idtipo_lente`),
  ADD CONSTRAINT `fk_lentes_Tratamento1` FOREIGN KEY (`idTratamento`) REFERENCES `tratamento` (`idTratamento`);

--
-- Restrições para tabelas `lentes_contato`
--
ALTER TABLE `lentes_contato`
  ADD CONSTRAINT `fk_lentes_contato_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lentes_contato_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_lentes_Material_Lente10` FOREIGN KEY (`idMaterial`) REFERENCES `material_lente_contato` (`idMaterial_Lente`),
  ADD CONSTRAINT `fk_lentes_tipo_lente10` FOREIGN KEY (`idTipo_Lente`) REFERENCES `tipo_lente_contato` (`idtipo_lente`),
  ADD CONSTRAINT `fk_lentes_Tratamento10` FOREIGN KEY (`idTratamento`) REFERENCES `tratamento_contato` (`idTratamento`);

--
-- Restrições para tabelas `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_login_tipos_login1` FOREIGN KEY (`idtipos_login`) REFERENCES `tipos_login` (`idtipos_login`),
  ADD CONSTRAINT `fk_login_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Restrições para tabelas `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_marca_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_material_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD CONSTRAINT `fk_movimentacoes_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movimentacoes_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `nota_detalhe`
--
ALTER TABLE `nota_detalhe`
  ADD CONSTRAINT `fk_nota_detalhe_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_detalhe_nota_fiscal1` FOREIGN KEY (`idnota`) REFERENCES `nota_fiscal` (`idnota`),
  ADD CONSTRAINT `fk_nota_detalhe_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD CONSTRAINT `fk_nota_fiscal_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_fiscal_Venda1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`);

--
-- Restrições para tabelas `oculos`
--
ALTER TABLE `oculos`
  ADD CONSTRAINT `fk_oculos_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `optometrista`
--
ALTER TABLE `optometrista`
  ADD CONSTRAINT `fk_Optometrista_contato` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idContato`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_optometrista_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Optometrista_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD CONSTRAINT `fk_ordem_servico_Clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ordem_servico_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ordem_servico_Funcionarios` FOREIGN KEY (`id_Funcionario`) REFERENCES `cadastro_funcionarios` (`idFuncionario`),
  ADD CONSTRAINT `fk_ordem_servico_Optometrista` FOREIGN KEY (`id_Optometrista`) REFERENCES `optometrista` (`id_Optometrista`),
  ADD CONSTRAINT `fk_ordem_servico_Produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_ordem_servico_Receita_Exame` FOREIGN KEY (`id_Receita`) REFERENCES `receita_exame` (`idReceita`);

--
-- Restrições para tabelas `pedido_detalhe`
--
ALTER TABLE `pedido_detalhe`
  ADD CONSTRAINT `fk_pedido_detalhe_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pedido_Detalhe_Pedido_Registro1` FOREIGN KEY (`idPedido_Registro`) REFERENCES `pedido_registro` (`idPedido_Registro`),
  ADD CONSTRAINT `fk_Pedido_detalhe_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);

--
-- Restrições para tabelas `pedido_registro`
--
ALTER TABLE `pedido_registro`
  ADD CONSTRAINT `fk_pedido_registro_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pedido_Registro_Funcionarios1` FOREIGN KEY (`idFuncionario`) REFERENCES `cadastro_funcionarios` (`idFuncionario`);

--
-- Restrições para tabelas `pessoafisica`
--
ALTER TABLE `pessoafisica`
  ADD CONSTRAINT `fk_PessoaFisica_Clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pessoafisica_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pessoajuridica`
--
ALTER TABLE `pessoajuridica`
  ADD CONSTRAINT `fk_PessoaJuridica_Clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idClientes`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pessoajuridica_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `pis_estadual`
--
ALTER TABLE `pis_estadual`
  ADD CONSTRAINT `fk_PIS_Estadual_CSOSN_PIS1` FOREIGN KEY (`idCSOSN`) REFERENCES `csosn_pis` (`idCSOSN`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);

--
-- Restrições para tabelas `receita_exame`
--
ALTER TABLE `receita_exame`
  ADD CONSTRAINT `fk_receita_exame_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Receita_Exame_Exame1` FOREIGN KEY (`idExame`) REFERENCES `exame` (`idExame`),
  ADD CONSTRAINT `fk_Receita_Exame_Optometrista1` FOREIGN KEY (`id_Optometrista`) REFERENCES `optometrista` (`id_Optometrista`);

--
-- Restrições para tabelas `tipos_login`
--
ALTER TABLE `tipos_login`
  ADD CONSTRAINT `fk_tipos_login_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tipo_lente_contato`
--
ALTER TABLE `tipo_lente_contato`
  ADD CONSTRAINT `fk_tipo_lente_contato_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_Empresa_Empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_Venda_cadastro_funcionarios1` FOREIGN KEY (`idFuncionario`) REFERENCES `cadastro_funcionarios` (`idFuncionario`),
  ADD CONSTRAINT `fk_venda_caixa1` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`id_caixa`),
  ADD CONSTRAINT `fk_venda_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Venda_Tipo_Pagamento1` FOREIGN KEY (`idPagamento`) REFERENCES `tipo_pagamento` (`idPagamento`);

--
-- Restrições para tabelas `venda_itens`
--
ALTER TABLE `venda_itens`
  ADD CONSTRAINT `fk_venda_itens_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Venda_Itens_Produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_Venda_Itens_Venda1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
