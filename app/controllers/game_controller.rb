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
    puts @result
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
end



class RpsController < ApplicationController


end
