require "pg"

class Database
  def initialize
    @conn = PG.connect(
      dbname: "pokedex_db", 
      user: "usuario",
      password: "senha",
      host: "localhost", 
      port: 5432
    )
    create_table
  end

  def create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS pokemons(
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        base_experience INT,
        height INT,
        weight INT,
        types VARCHAR(100)
      )
    SQL

    @conn.exec(sql)
  end

  def insert_pokemon(name, base_experience, height, weight, types)
    @conn.exec_params(
      "INSERT INTO pokemons (name, base_experience, height, weight, types) VALUES ($1, $2, $3, $4, $5)",
      [name, base_experience, height, weight, types]
    )
  end

  def all_pokemons
    @conn.exec("SELECT * FROM pokemons ORDER BY id")
  end

  def find_pokemon_by_name(name)
    @conn.exec_params("SELECT * FROM pokemons WHERE name ILIKE $1", ["%#{name}%"])
  end

  def find_pokemon_by_id(pid)
    @conn.exec_params("SELECT * FROM pokemons WHERE id = $1", [pid])
  end

  def clear_pokemons
    @conn.exec("TRUNCATE pokemons RESTART IDENTITY;")
  end
end
