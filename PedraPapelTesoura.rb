class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  regra = [[[ "R", "S"] , "R"],[[ "S", "P"] , "P"],[[ "P", "R"] , "P"]]
  valido = ["R", "S", "P"]
  game_flat = game.flatten
  
  contador = 0
  llparametro_erro = false
  while contador <= game_flat.size
    if (contador % 2 != 0 )
      if valido.index(game_flat[contador]) == nil
         llparametro_erro = true      
      end
    end
    contador = contador + 1
  end
  
  if (llparametro_erro == false)
    raise NoSuchStrategyError 
  end
  
  puts game_flat.size 
  
  jogador1 = [game[0]]
  jogador2 = [game[1]]
  
  arma_jogador1 = jogador1[1]
  arma_jogador2 = jogador2[1]
  
  if (arma_jogador1 == "R" and arma_jogador2 == "P")
      return jogador2.to_s
  end
  if (arma_jogador1 == "R" and arma_jogador2 == "S")
      return jogador1.to_s
  end
    
  if (arma_jogador1 == "S" and arma_jogador2 == "P")
      return jogador1.to_s
  end  
  
  return jogador1.to_s
end

puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ] )
puts rps_game_winner([ [ "Armando", "P" ], [ "Dave", "s" ] ] )
