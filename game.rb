require_relative 'player'
require_relative 'math_question'

class Game
  def initialize(player1, player2)
    @players = [player1, player2] 
    @current_player = 0 # 0 is player1 index in @players array

  def start
    while @players[0].alive? && @players[1].alive?
      q = MathQuestion.new
      puts "#{@players[@current_player].name}: #{q.question}"
      user_answer = gets.chomp.to_i # convert to integer
      if user_answer != q.answer
        puts "Wrong answer. #{@players[@current_player].name} loses a life"
        @players[@current_player].lose_life # deduct a life from current player
      else
        puts "Correct!"
      end
      puts "Scores: #{@players[0].name}: #{@players[0].lives}/3 vs #{@players[1].name}: #{@players[1].lives}/3"
      @current_player = @current_player == 0 ? 1 : 0 # switch turns
    end
  
    if @players[0].lives == 0
      puts "#{@players[1].name} wins with a score of #{@players[1].lives}/3"
    else
      puts
      "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
    end
    end
    
      
end


    