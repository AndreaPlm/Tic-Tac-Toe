require 'pry'
require 'rubocop'


class Game # Une partie contient des joueurs et un plateau

=begin
    def get_players()
      @players = []

      puts "Player 1: enter your name"
      name1 =  gets.chomp
      player1 = Players.new(name1)
      @players << player1
      puts "Player 2: enter your name"
      name2 = gets.chomp
      player2 = Players.new(name2)
      @players << player2
    end
=end


end # End Game


class Player # Chaque joueur possède un nom et un score
  attr_accessor :player_name, :score

  def initialize(name)
    @player_name = name
    @score = 0
  end

end # End Player


class Board # Un plateau contient des cases
  attr_accessor :board_cases

  def initialize # A la creation un plateau est vide, on le rempli de cases vides
    @board_cases = []
      a1 = BoardCase.new(0,1)
      @board_cases << a1
      a2 = BoardCase.new(0,2)
      @board_cases << a2
      a3 = BoardCase.new(0,3)
      @board_cases << a3
      b1 = BoardCase.new(0,4)
      @board_cases << b1
      b2 = BoardCase.new(0,5)
      @board_cases << b2
      b3 = BoardCase.new(0,6)
      @board_cases << b3
      c1 = BoardCase.new(0,7)
      @board_cases << c1
      c2 = BoardCase.new(0,8)
      @board_cases << c2
      c3 = BoardCase.new(0,9)
      @board_cases << c3
  end


  def to_s
    i = 0
    @board_cases.each do |elem|
      if i == 3
      print "\n"
      i = 0
      end
    print elem.to_s
    i += 1
    end
  end

  # Vider un plateau
  def empty()
    @board_cases = []
  end

  def play(player, nb_case)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)


  end

  def victory?
    #TO DO : qui gagne ?
  end


end # End Board



class BoardCase # Les cases d'un plateau

  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

    attr_accessor :val, :case_number

    def initialize(val, nb)
      @val = val
      @case_number = nb
    end

    def to_s
      # Renvoi la valeur au format string
      if @val == 0 then return "| |"
      elsif @val == 1 then return "|X|"
      elsif @val == 2 then return "|O|"
      end
    end

end # End BoardCase



binding.pry
