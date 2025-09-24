require "httparty"

class PokeAPI
  BASE_URL = "https://pokeapi.co/api/v2/pokemon/"

  def get_pokemon(identifier)
    response = HTTParty.get("#{BASE_URL}#{identifier}")
    if response.code == 200
      {
        name: response["name"],
        base_experience: response["base_experience"],
        height: response["height"],
        weight: response["weight"],
        types: response["types"].map { |t| t["type"]["name"] }.join(", ")
      }
    else
      nil
    end
  end
end
