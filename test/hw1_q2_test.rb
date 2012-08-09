require 'minitest/autorun'
require './hw1_q2'

class RockScissorsPaperTest < MiniTest::Unit::TestCase
  def test_rock_first_beats_scissors_second
    assert_equal ["foo", "r"], rps_game_winner([["foo", "r"], ["bar", "s"]])
  end
  
  def test_rock_second_beats_scissors_first
    assert_equal ["bar", "r"], rps_game_winner([["foo", "s"], ["bar", "r"]])
  end

  def test_scissors_first_beats_paper_second
    assert_equal ["foo", "S"], rps_game_winner([["foo", "S"], ["bar", "p"]])
  end
  
  def test_scissors_second_beats_paper_first
    assert_equal ["bar", "s"], rps_game_winner([["foo", "P"], ["bar", "s"]])
  end

  def test_paper_first_beats_rock_second
    assert_equal ["foo", "P"], rps_game_winner([["foo", "P"], ["bar", "R"]])
  end
  
  def test_paper_second_beats_rock_first
    assert_equal ["bar", "P"], rps_game_winner([["foo", "R"], ["bar", "P"]])
  end

  def test_draw
    assert_equal ["foo", "R"], rps_game_winner([["foo", "R"], ["bar", "r"]])
    assert_equal ["bar", "s"], rps_game_winner([["bar", "s"], ["foo", "s"]])
  end

  def test_incorrect_number_of_players_raises_error
    assert_raises(WrongNumberOfPlayersError) { rps_game_winner([]) }
    assert_raises(WrongNumberOfPlayersError) { rps_game_winner([["foo", "r"]]) }
    assert_raises(WrongNumberOfPlayersError) { rps_game_winner([["foo", "r"], ["bar", "p"], ["baz", "s"]]) }
  end

  def test_duplicate_player_raises_error
    assert_raises(WrongNumberOfPlayersError) { rps_game_winner([["foo", "r"], ["foo", "p"]]) }
  end

  def test_wrong_strategy_raises_error
    assert_raises(NoSuchStrategyError) { rps_game_winner([["foo", "&"], ["bar", "p"]]) }
    assert_raises(NoSuchStrategyError) { rps_game_winner([["foo", "ra"], ["bar", "p"]]) }
    assert_raises(NoSuchStrategyError) { rps_game_winner([["foo", "r"], ["bar", "ap"]]) }
  end
end

class RockScissorsPaperTournamentTest < MiniTest::Unit::TestCase
  def test_one_level_tournament
    assert_equal ["Richard X.", "P"], rps_tournament_winner([["David E.", "R"], ["Richard X.", "P"]])
  end

  def test_two_level_tournament
    assert_equal ["Allen", "S"], rps_tournament_winner([
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ])
  end

  def test_three_level_tournament
    assert_equal ["Richard", "R"], rps_tournament_winner([
      [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"], ["Michael", "S"] ],
      ],
      [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
      ]
    ])
  end
end
