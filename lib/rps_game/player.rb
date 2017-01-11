module RPSGame
  class Player
    # store the users answer
    attr_accessor :status

    def play_again?(input)
      @status = (input.strip.downcase == "n") ? false : true
    end
  end
end