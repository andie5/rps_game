
# Create a command line Rock-Paper-Scissors game, with 1 or 2 players modes
# All the actions relevant to the game
module RPSGame
  class Game
    attr_accessor :no_players, :player1, :player2, :p1_input, :p2_input

    def initialize
      # initialize the item options as 1,2,3
      @items = {1=>"rock", 2=>"paper", 3=> "scissors"}
      @game_play = true
    end

    def who_won(player1, player2)
      if (player1 == 1 and player2 == 2)
        result = "Player 2 wins"
      elsif (player1 == 1 and player2 == 3)
        result = "Player 1 wins"
      elsif (player1 == 2 and player2 == 1)
        result = "Player 1 wins"
      elsif (player1 == 2 and player2 == 3)
        result = "Player 2 wins"
      elsif (player1 == 3 and player2 == 1)
        result = "Player 2 wins" 
      elsif (player1 == 3 and player2 == 2)
        result = "Player 1 wins"
      else
        result = "That was a draw"
      end
      result
    end

    def select_move
      # binding.pry 
      puts "Player 1 enter move >"  
      @p1_input = gets.chomp.to_i

      puts "Player 1 chose #{@p1_input} - #{@items[@p1_input]}"
      puts "============================================================"
    
      if(@no_players == 1)
        @p2_input = @player2.random_move
        puts "Computer chose #{@p2_input} - #{@items[@p2_input]}"
      else
        puts "Player 2 enter move >"  
        @p2_input = gets.chomp.to_i
        puts "Player 2 chose #{@p2_input} - #{@items[@p2_input]}"
      end

      puts "============================================================"

      player_won = who_won(@p1_input, @p2_input)
      puts "#{player_won}"
      puts "============================================================"
      puts "Do you want to play again?"
      puts "Y for yes"
      puts "N for no"
      
      user_input = gets.chomp
      @game_play = @player1.play_again?(user_input)

      if @game_play
        select_move
      else 
        puts "Game over. Thanks for playing!"
      end
    end

    def play
      initial_instructions
       
      @no_players = gets.chomp.to_i
      
      if(@no_players == 1)
        @player1 = Player.new
        @player2 = Computer.new
      elsif(@no_players == 2)
        @player1 = Player.new
        @player2 = Player.new
      else
        puts "You didn't enter 1 or 2 for the number of players"
      end

      puts "You have chosen #{@no_players} player(s)"
      puts "Enter 1 for Rock"
      puts "Enter 2 for Paper"
      puts "Enter 3 for Scissors"
      puts "============================================================"

      # Next move
      select_move
    end

    def initial_instructions
      puts "Hello, Let's play rock, paper, scissors!"
      puts "============================================================"
      puts "Instructions:"
      puts "Enter the number of players 1 or 2, if you enter 1 you will play aginst the master computer"
    end
  end
end
