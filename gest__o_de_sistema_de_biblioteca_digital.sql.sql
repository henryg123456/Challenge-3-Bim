-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/09/2024 às 02:47
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestão de sistema de biblioteca digital`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `ID_Autor` int(7) NOT NULL,
  `Nome_Autor` varchar(50) NOT NULL,
  `Nacionalidade` text NOT NULL,
  `Ano_Nascimento` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliação_livro`
--

CREATE TABLE `avaliação_livro` (
  `ID_Avaliacao` int(7) NOT NULL,
  `ID_Usuário` int(7) NOT NULL,
  `ID_Livro` int(7) NOT NULL,
  `Nota` int(5) NOT NULL,
  `Comentário` int(100) NOT NULL,
  `Data_Avaliacao` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `ID_Categoria` int(7) NOT NULL,
  `Nome_Categoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--

CREATE TABLE `editora` (
  `ID_Editora` int(7) NOT NULL,
  `Nome_Editora` int(40) NOT NULL,
  `Telefone` int(18) NOT NULL,
  `Endereço` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empréstimo`
--

CREATE TABLE `empréstimo` (
  `ID_Empréstimo` int(7) NOT NULL,
  `ID_Usuário` int(7) NOT NULL,
  `ID_Livro` int(7) NOT NULL,
  `Data_empréstimo` int(12) NOT NULL,
  `Data_devolução` int(12) NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `histórico_emprestimo`
--

CREATE TABLE `histórico_emprestimo` (
  `ID_Historico` int(7) NOT NULL,
  `ID_Usuário` int(7) NOT NULL,
  `ID_Livro` int(7) NOT NULL,
  `Data_empréstimo` int(12) NOT NULL,
  `Data_devolução` int(12) NOT NULL,
  `Multa_Aplicada` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `ID_Livro` int(7) NOT NULL,
  `Título` text NOT NULL,
  `Autor` varchar(40) NOT NULL,
  `Ano_publicação` int(20) NOT NULL,
  `ID_Categoria` int(7) NOT NULL,
  `ISBN` int(13) NOT NULL,
  `Quantidade_disponivel` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_autor`
--

CREATE TABLE `livro_autor` (
  `ID_Livro` int(7) NOT NULL,
  `ID_Autor` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `multa`
--

CREATE TABLE `multa` (
  `ID_Multa` int(7) NOT NULL,
  `ID_Empréstimo` int(7) NOT NULL,
  `Valor` int(40) NOT NULL,
  `Status_pagamento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_usuário`
--

CREATE TABLE `perfil_usuário` (
  `ID_Perfil` int(7) NOT NULL,
  `ID_Usuário` int(7) NOT NULL,
  `Telefone` int(20) DEFAULT NULL,
  `Endereço` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `ID_Reserva` int(7) NOT NULL,
  `ID_Usuário` int(7) NOT NULL,
  `ID_Livro` int(7) NOT NULL,
  `Data_Reserva` int(12) NOT NULL,
  `Status_Reserva` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuário`
--

CREATE TABLE `usuário` (
  `ID_usuário` int(7) NOT NULL,
  `Nome` text NOT NULL,
  `Email` varchar(80) NOT NULL,
  `Senha` int(20) NOT NULL,
  `Data_Registro` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`ID_Autor`);

--
-- Índices de tabela `avaliação_livro`
--
ALTER TABLE `avaliação_livro`
  ADD PRIMARY KEY (`ID_Avaliacao`),
  ADD KEY `ID_Usuário` (`ID_Usuário`),
  ADD KEY `ID_Livro` (`ID_Livro`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`ID_Editora`);

--
-- Índices de tabela `empréstimo`
--
ALTER TABLE `empréstimo`
  ADD PRIMARY KEY (`ID_Empréstimo`),
  ADD KEY `ID_Usuário` (`ID_Usuário`),
  ADD KEY `ID_Livro` (`ID_Livro`);

--
-- Índices de tabela `histórico_emprestimo`
--
ALTER TABLE `histórico_emprestimo`
  ADD PRIMARY KEY (`ID_Historico`),
  ADD KEY `ID_Usuário` (`ID_Usuário`),
  ADD KEY `ID_Livro` (`ID_Livro`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`ID_Livro`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Índices de tabela `livro_autor`
--
ALTER TABLE `livro_autor`
  ADD KEY `ID_Livro` (`ID_Livro`),
  ADD KEY `ID_Autor` (`ID_Autor`);

--
-- Índices de tabela `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`ID_Multa`) USING BTREE,
  ADD KEY `ID_Empréstimo` (`ID_Empréstimo`);

--
-- Índices de tabela `perfil_usuário`
--
ALTER TABLE `perfil_usuário`
  ADD PRIMARY KEY (`ID_Perfil`) USING BTREE,
  ADD KEY `ID_Usuário` (`ID_Usuário`) USING BTREE;

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID_Reserva`),
  ADD KEY `ID_Usuário` (`ID_Usuário`),
  ADD KEY `ID_Livro` (`ID_Livro`);

--
-- Índices de tabela `usuário`
--
ALTER TABLE `usuário`
  ADD PRIMARY KEY (`ID_usuário`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
