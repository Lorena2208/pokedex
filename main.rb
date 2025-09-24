require_relative 'app/pokedex_app'

app = PokedexApp.new

loop do
  puts "\n=== Menu Pokédex ==="
  puts "1. Importar Pokémon pelo nome/número"
  puts "2. Listar todos os Pokémon armazenados"
  puts "3. Buscar Pokémon por nome"
  puts "4. Limpar Pokédex"
  puts "5. Sair"
  print "Escolha uma opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    print "Digite o nome ou número do Pokémon: "
    identifier = gets.chomp
    app.importar_pokemon(identifier)

  when 2
    pokemons = app.listar_pokemons
    if pokemons.ntuples.zero?
      puts "Nenhum Pokémon armazenado ainda."
    else
      pokemons.each do |p|
        puts "##{p['id']} - #{p['name'].capitalize} | Exp: #{p['base_experience']} | Altura: #{p['height']} | Peso: #{p['weight']} | Tipos: #{p['types']}"
      end
    end

  when 3
    print "Digite o nome do Pokémon: "
    nome = gets.chomp
    resultados = app.buscar_por_nome(nome).to_a
    if resultados.empty?
      puts "Nenhum Pokémon encontrado com o nome '#{nome}'."
    else
      resultados.each do |p|
        puts "##{p['id']} - #{p['name'].capitalize} | Exp: #{p['base_experience']} | Altura: #{p['height']} | Peso: #{p['weight']} | Tipos: #{p['types']}"
      end
    end

  when 4
    app.limpar
    puts "Pokédex limpa!"

  when 5
    puts "Saindo..."
    break

  else
    puts "Opção inválida!"
  end
end
