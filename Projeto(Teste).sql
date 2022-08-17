
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `numeroCasa` VARCHAR(45) NOT NULL,
  `cpf` DECIMAL(11) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `fkEndereco` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `mydb`.`endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATETIME NOT NULL,
  `valorTotal` VARCHAR(45) NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produtos` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`itensVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`itensVendidos` (
  `idItensVendidos` INT NOT NULL AUTO_INCREMENT,
  `fkProduto` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  `quantidade` DECIMAL NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idItensVendidos`),
    FOREIGN KEY (`fkProduto`)
    REFERENCES `mydb`.`produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkVenda`)
    REFERENCES `mydb`.`venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estoque` (
  `idestoque` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `quantidade` DECIMAL NOT NULL,
  `quantidadeMinima` DECIMAL NOT NULL,
  `custoUnitario` FLOAT NOT NULL,
  `dataCompra` DATETIME NOT NULL,
  PRIMARY KEY (`idestoque`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`itensProdutos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`itensProdutos` (
  `iditensProdutos` INT NOT NULL AUTO_INCREMENT,
  `fkEstoque` INT NOT NULL,
  `fkProduto` INT NOT NULL,
  `quantidade` DECIMAL NOT NULL,
  PRIMARY KEY (`iditensProdutos`),
    FOREIGN KEY (`fkEstoque`)
    REFERENCES `mydb`.`estoque` (`idestoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkProduto`)
    REFERENCES `mydb`.`produtos` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefone` (
  `idtelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` DECIMAL(9) NOT NULL,
  `fkCliente` INT NOT NULL,
  `ddd` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idtelefone`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

