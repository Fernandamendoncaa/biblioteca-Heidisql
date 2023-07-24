-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           11.2.0-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para biblioteca
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `biblioteca`;

-- Copiando estrutura para tabela biblioteca.autores
CREATE TABLE IF NOT EXISTS `autores` (
  `nomeautor` varchar(50) DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela biblioteca.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `nome` varchar(50) NOT NULL DEFAULT '',
  `endereco` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` int(15) DEFAULT NULL,
  `sexo` enum('F','M') DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela biblioteca.livroautores
CREATE TABLE IF NOT EXISTS `livroautores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idLivro` int(11) NOT NULL,
  `idAutor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCliente` (`idLivro`),
  KEY `idAutor` (`idAutor`),
  CONSTRAINT `FK1livro` FOREIGN KEY (`idLivro`) REFERENCES `livros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKautor` FOREIGN KEY (`idAutor`) REFERENCES `autores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela biblioteca.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `nome` varchar(50) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `editora` varchar(50) DEFAULT NULL,
  `publicacao` datetime DEFAULT NULL,
  `ISBN` int(13) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disponivel` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela biblioteca.locacao
CREATE TABLE IF NOT EXISTS `locacao` (
  `idCliente` int(11) DEFAULT NULL,
  `dataemprestimo` datetime DEFAULT NULL,
  `datadevolucao` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `FK2locacaoCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela biblioteca.locacaolivros
CREATE TABLE IF NOT EXISTS `locacaolivros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idLocacao` int(11) NOT NULL DEFAULT 0,
  `idLivro` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idLocacao` (`idLocacao`),
  KEY `idLivro` (`idLivro`),
  CONSTRAINT `FK1locacao` FOREIGN KEY (`idLocacao`) REFERENCES `locacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK2locacaoLivro` FOREIGN KEY (`idLivro`) REFERENCES `livros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
