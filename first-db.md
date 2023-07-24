# Documentação do Banco de Dados - Programa de Gerenciamento de Farmácia

## Tabela: Produto

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do produto                 |
| nome             | VARCHAR(255) | NOT NULL         | Nome do produto                                 |
| descricao        | TEXT         | NOT NULL         | Descrição do produto                            |
| codigo           | VARCHAR(50)  | NOT NULL         | Código do produto                               |
| fabricante       | VARCHAR(100) |                  | Nome do fabricante do produto                   |
| fornecedor       | VARCHAR(100) |                  | Nome do fornecedor do produto                   |
| preco            | DECIMAL(10,2)| NOT NULL         | Preço unitário do produto                       |
| data_validade    | DATE         | NOT NULL         | Data de validade do produto                     |
| quantidade_estoque| INT         | NOT NULL         | Quantidade disponível em estoque do produto     |
| data_cadastro    | DATETIME     | NOT NULL, DEFAULT| Data e hora do cadastro do produto              |

## Tabela: Cliente

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do cliente                 |
| nome             | VARCHAR(255) | NOT NULL         | Nome do cliente                                 |
| cpf              | VARCHAR(14)  | NOT NULL, UNIQUE | CPF do cliente                                  |
| endereco         | VARCHAR(500) |                  | Endereço do cliente                             |
| telefone         | VARCHAR(20)  |                  | Número de telefone do cliente                   |
| email            | VARCHAR(100) |                  | Endereço de e-mail do cliente                   |
| data_nascimento  | DATE         |                  | Data de nascimento do cliente                   |
| sexo             | ENUM         |                  | Gênero do cliente (M - Masculino, F - Feminino, Outro)|
| data_cadastro    | DATETIME     | NOT NULL, DEFAULT| Data e hora do cadastro do cliente              |

## Tabela: Venda

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único da venda                   |
| cliente_id       | INT          | NOT NULL         | Chave estrangeira para a tabela Cliente         |
| data_venda       | DATETIME     | NOT NULL, DEFAULT| Data e hora da venda                           |
| total            | DECIMAL(10,2)| NOT NULL         | Valor total da venda                           |
| forma_pagamento  | ENUM         |                  | Forma de pagamento da venda                     |

## Tabela: ItemVenda

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do item de venda           |
| venda_id         | INT          | NOT NULL         | Chave estrangeira para a tabela Venda           |
| produto_id       | INT          | NOT NULL         | Chave estrangeira para a tabela Produto         |
| quantidade       | INT          | NOT NULL         | Quantidade do produto vendido                   |
| preco_unitario   | DECIMAL(10,2)| NOT NULL         | Preço unitário do produto                       |
| subtotal         | DECIMAL(10,2)| NOT NULL         | Subtotal do item de venda                       |

## Tabela: Estoque

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do registro de estoque      |
| produto_id       | INT          | NOT NULL         | Chave estrangeira para a tabela Produto         |
| quantidade       | INT          | NOT NULL         | Quantidade em estoque do produto                |
| data_atualizacao | DATETIME     | NOT NULL, DEFAULT| Data e hora da última atualização do estoque    |

## Tabela: Fornecedor

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do fornecedor               |
| nome             | VARCHAR(255) | NOT NULL         | Nome do fornecedor                              |
| cnpj             | VARCHAR(18)  | NOT NULL, UNIQUE | CNPJ do fornecedor                              |
| endereco         | VARCHAR(500) |                  | Endereço do fornecedor                          |
| telefone         | VARCHAR(20)  |                  | Número de telefone do fornecedor                |
| email            | VARCHAR(100) |                  | Endereço de e-mail do fornecedor                |
| data_cadastro    | DATETIME     | NOT NULL, DEFAULT| Data e hora do cadastro do fornecedor           |

## Tabela: Compra

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único da compra                  |
| fornecedor_id    | INT          | NOT NULL         | Chave estrangeira para a tabela Fornecedor      |
| data_compra      | DATETIME     | NOT NULL, DEFAULT| Data e hora da compra                          |
| total            | DECIMAL(10,2)| NOT NULL         | Valor total da compra                          |
| forma_pagamento  | ENUM         |                  | Forma de pagamento da compra                    |

## Tabela: ItemCompra

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do item de compra          |
| compra_id        | INT          | NOT NULL         | Chave estrangeira para a tabela Compra          |
| produto_id       | INT          | NOT NULL         | Chave estrangeira para a tabela Produto         |
| quantidade       | INT          | NOT NULL         | Quantidade do produto comprado                  |
| preco_unitario   | DECIMAL(10,2)| NOT NULL         | Preço unitário do produto                       |
| subtotal         | DECIMAL(10,2)| NOT NULL         | Subtotal do item de compra                      |

## Tabela: Funcionario

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do funcionário              |
| nome             | VARCHAR(255) | NOT NULL         | Nome do funcionário                             |
| cpf              | VARCHAR(14)  | NOT NULL, UNIQUE | CPF do funcionário                              |
| endereco         | VARCHAR(500) |                  | Endereço do funcionário                         |
| telefone         | VARCHAR(20)  |                  | Número de telefone do funcionário               |
| email            | VARCHAR(100) |                  | Endereço de e-mail do funcionário               |
| cargo            | VARCHAR(100) |                  | Cargo do funcionário                            |
| data_nascimento  | DATE         |                  | Data de nascimento do funcionário                |
| data_admissao    | DATE         | NOT NULL, DEFAULT| Data de admissão do funcionário                 |

## Tabela: VendaFuncionario

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do registro de venda        |
| venda_id         | INT          | NOT NULL         | Chave estrangeira para a tabela Venda           |
| funcionario_id   | INT          | NOT NULL         | Chave estrangeira para a tabela Funcionario     |
| comissao         | DECIMAL(10,2)| NOT NULL         | Valor da comissão recebida pelo funcionário     |

## Tabela: Categoria

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único da categoria               |
| nome             | VARCHAR(255) | NOT NULL         | Nome da categoria                               |
| descricao        | TEXT         |                  | Descrição da categoria                          |

## Tabela: ProdutoCategoria

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do registro de relação      |
| produto_id       | INT          | NOT NULL         | Chave estrangeira para a tabela Produto         |
| categoria_id     | INT          | NOT NULL         | Chave estrangeira para a tabela Categoria       |

## Tabela: FornecedorCategoria

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do registro de relação      |
| fornecedor_id    | INT          | NOT NULL         | Chave estrangeira para a tabela Fornecedor      |
| categoria_id     | INT          | NOT NULL         | Chave estrangeira para a tabela Categoria       |

## Tabela: Usuario

| Coluna           | Tipo         | Restrições        | Descrição                                       |
|------------------|--------------|-------------------|-------------------------------------------------|
| id               | INT          | NOT NULL, PK, AI  | Identificador único do usuário                  |
| nome             | VARCHAR(255) | NOT NULL         | Nome do usuário                                 |
| cpf              | VARCHAR(14)  | NOT NULL, UNIQUE | CPF do usuário                                  |
| endereco         | VARCHAR(500) |                  | Endereço do usuário                             |
| telefone         | VARCHAR(20)  |                  | Número de telefone do usuário                   |
| email            | VARCHAR(100) |                  | Endereço de e-mail do usuário                   |
| senha            | VARCHAR(100) | NOT NULL         | Senha do usuário                                |
| data_nascimento  | DATE         |                  | Data de nascimento do usuário                    |
