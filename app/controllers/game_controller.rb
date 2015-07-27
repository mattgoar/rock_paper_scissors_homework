class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  # Your code goes below.


  def rps
    # Nothing to do here.
    @computer_move = computer_move
    @your_move = params["the_move"]
    @result = who_wins(@your_move, @computer_move)
    save_game(@your_move, @computer_move, @result)
    @games = Move.all
    # @games.delete_all
    @gamecount = @games.count
    render("move.html.erb")
  end

  def computer_move
    moves = ['Rock','Paper','Scissors']
    return moves[rand(3)]
  end

  def who_wins (human, computer_move)
    winners =
    [['rock', 'scissors'],
    ['scissors', 'paper'],
    ['paper', 'rock']]
    if winners.include?(Array[human.downcase, computer_move.downcase])
      return "win"
    elsif human.downcase == computer_move.downcase
      return "tied"
    else
      return "lose"
    end
  end

  def save_game (human, computer, result)
    r = Move.new(user_wins:0, computer_wins:0, tie:0)
    r.user_move = human
    r.computer_move = computer.downcase
    if result == "win"
      r.user_wins = 1
    elsif  result == "lose"
      r.computer_wins = 1
    else r.tie = 1
    end
    r.save
  end

  def get_game_stats (move)

  end

  def get_total_stats

  end


end
