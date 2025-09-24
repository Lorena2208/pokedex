# Pokédex em Ruby
Este projeto é uma aplicação simples em Ruby que consome a PokeAPI, armazena os dados em um banco de dados PostgreSQL e permite consultar os Pokémon registrados.

## Funcionalidades
- Importar Pokémon pelo nome ou número
- Armazenar dados no PostgreSQL
- Listar todos os Pokémon salvos
- Buscar Pokémon pelo nome
- Limpar toda a Pokédex

---

## Tecnologias
- Ruby 3.4.6
- PostgreSQL

---

## Gems
- pg
- httparty
---

## Instalação
- Instalar as dependencias:
bundle install

- Configurar o banco de dados no PostgreSQl

CREATE DATABASE pokedex_db;

CREATE TABLE pokemons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    base_experience INT,
    height INT,
    weight INT,
    types VARCHAR(100)
);

- Substituir o user e a senha no arquivo database.rb para a senha do usuário

- Rodar a aplicação main.rb

---

## Exemplo da aplicação em uso
  === Menu Pokédex ===
1. Importar Pokémon pelo nome/número
2. Listar todos os Pokémon armazenados
3. Buscar Pokémon por nome
4. Limpar Pokédex
5. Sair

Escolha uma opção: 1
Digite o nome ou número do Pokémon: bulbasaur
Bulbasaur foi adicionado à Pokédex!
