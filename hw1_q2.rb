class WrongNumberOfPlayersError < StandardError
end

class NoSuchStrategyError < StandardError
end

def game_outcome(first, second)
  return -1 if (first == "r" and second == "s") or (first == "s" and second == "p") or (first == "p" and second == "r")
  return 0 if first == second
  return 1 if (first == "s" and second == "r") or (first == "p" and second == "s") or (first == "r" and second == "p")
  raise NoSuchStrategyError
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise WrongNumberOfPlayersError if game[0][0] == game[1][0]
  game = game.sort { |x, y| game_outcome(x[1].downcase, y[1].downcase) }
  return game[0]
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    rps_game_winner(tournament)
  else
    rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end
