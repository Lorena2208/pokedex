require_relative '../services/database'
require_relative '../services/poke_api'

class PokedexApp
  def initialize
    @db = Database.new
    @api = PokeAPI.new
  end

  def importar_pokemon(identifier)
    pokemon = @api.get_pokemon(identifier)
    if pokemon
      @db.insert_pokemon(
        pokemon[:name],
        pokemon[:base_experience],
        pokemon[:height],
        pokemon[:weight],
        pokemon[:types]
      )
      puts "#{pokemon[:name].capitalize} foi adicionado à Pokédex!"
    else
      puts "Pokémon '#{identifier}' não encontrado!"
    end
  end

  def listar_pokemons
    @db.all_pokemons
  end

  def buscar_por_nome(nome)
    @db.find_pokemon_by_name(nome)
  end

  def limpar
    @db.clear_pokemons
  end
end
