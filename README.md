# Lojinha

[![Build Status](https://github.com/mhoffnn/lojinha/actions/workflows/elixir_test.yml/badge.svg)](https://github.com/mhoffnn/lojinha/actions)
[![Coverage Status](https://coveralls.io/repos/mhoffnn/lojinha/badge.svg?branch=master)](https://coveralls.io/r/mhoffnn/lojinha?branch=master)
[![Last Updated](https://img.shields.io/github/last-commit/mhoffnn/lojinha.svg)](https://github.com/mhoffnn/lojinha/commits/master)


Implementação de um CRUD simples baseado em um sistema utilizado em uma lojinha para estudar sobre cobertura de testes.

Utilizado linguagem ***Elixir***, banco de dados embarcado ***SQLite3*** e para verificar a cobertura do código usado o ***coveralls***.

## Instalação

No terminal, rodar os comandos: 

```properties
mix deps.get
mix deps.compile
mix coveralls.html
```

---
## Rodar os testes

Ainda no terminal, executar o comando para rodar os testes e gerar o relatório de cobertura:

```properties
mix coveralls.html
```
Abrir em um navegador web o arquivo gerado no diretório */cover/excoveralls.html* para visualizar a cobertura dos testes por arquivo.

