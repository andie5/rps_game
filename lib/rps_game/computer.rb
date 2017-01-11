module RPSGame
  class Computer
    # Generate a random number to indicate the random item
    def random_move
      1 + rand(3)
    end
  end
end
