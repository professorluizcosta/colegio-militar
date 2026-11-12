-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29-Out-2026 às 08:52
-- Versão do servidor: 8.0.45-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora_veiculos`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `email`) VALUES
(1, 'Ana Souza', '(41) 99911-2233', 'ana.souza@email.com'),
(2, 'Bruno Lima', '(41) 99822-3344', 'bruno.lima@email.com'),
(3, 'Carla Mendes', '(41) 99733-4455', 'carla.mendes@email.com'),
(4, 'Daniel Oliveira', '(41) 99644-5566', 'daniel.oliveira@email.com'),
(5, 'Eduarda Santos', '(41) 99555-6677', 'eduarda.santos@email.com'),
(6, 'Felipe Costa', '(41) 99466-7788', 'felipe.costa@email.com'),
(7, 'Gabriela Rocha', '(41) 99377-8899', 'gabriela.rocha@email.com'),
(8, 'Henrique Alves', '(41) 99288-9900', 'henrique.alves@email.com'),
(9, 'Isabela Martins', '(41) 99199-0011', 'isabela.martins@email.com'),
(10, 'João Pereira', '(41) 99000-1122', 'joao.pereira@email.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  `data_retirada` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `id_cliente`, `id_veiculo`, `data_retirada`, `data_devolucao`) VALUES
(1, 1, 1, '2026-01-05', '2026-01-08'),
(2, 2, 3, '2026-01-10', '2026-01-13'),
(3, 3, 2, '2026-01-15', '2026-01-18'),
(4, 4, 5, '2026-01-20', '2026-01-25'),
(5, 5, 4, '2026-02-01', '2026-02-04'),
(6, 6, 6, '2026-02-05', '2026-02-08'),
(7, 7, 7, '2026-02-10', '2026-02-15'),
(8, 8, 8, '2026-02-15', '2026-02-17'),
(9, 9, 9, '2026-03-01', '2026-03-05'),
(10, 10, 10, '2026-03-10', '2026-03-13'),
(11, 1, 4, '2026-03-15', '2026-03-18'),
(12, 3, 6, '2026-03-20', '2026-03-22'),
(13, 5, 2, '2026-04-01', '2026-04-05'),
(14, 7, 1, '2026-04-10', '2026-04-14'),
(15, 2, 9, '2026-04-15', '2026-04-20'),
(16, 4, 3, '2026-05-01', '2026-05-03'),
(17, 6, 5, '2026-05-10', '2026-05-15'),
(18, 8, 7, '2026-06-01', '2026-06-06'),
(19, 9, 10, '2026-06-10', '2026-06-12'),
(20, 10, 8, '2026-06-15', '2026-06-18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `ano` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `nome`, `marca`, `modelo`, `ano`) VALUES
(1, 'Onix', 'Chevrolet', 'LT 1.0', 2022),
(2, 'HB20', 'Hyundai', 'Comfort 1.0', 2023),
(3, 'Gol', 'Volkswagen', '1.6 MSI', 2021),
(4, 'Corolla', 'Toyota', 'XEi 2.0', 2024),
(5, 'Civic', 'Honda', 'EXL 2.0', 2023),
(6, 'Argo', 'Fiat', 'Drive 1.3', 2022),
(7, 'Tracker', 'Chevrolet', 'Premier 1.2 Turbo', 2024),
(8, 'Kwid', 'Renault', 'Zen 1.0', 2021),
(9, 'Compass', 'Jeep', 'Longitude 1.3 Turbo', 2023),
(10, 'Polo', 'Volkswagen', 'Highline 1.0 TSI', 2024);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_emprestimo_cliente` (`id_cliente`),
  ADD KEY `fk_emprestimo_veiculo` (`id_veiculo`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk_emprestimo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_emprestimo_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
