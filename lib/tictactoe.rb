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

  def initialize # A la creation un plateau est vide, on le rempli de cases vides
    @board_cases = []
  end

  # Remplir un plateau avec des cases
  def fill_board(x=3, y=x)
    x.times do |x|
      y.times do |y|
        board_case = BoardCase.new(x,y)
        @board_cases << board_case
      end
    end
  end

  def board_display()
    @board_cases.each do |elem|
      elem.case_display
    end
  end


end # End Board



class BoardCase # Les cases d'un plateau
  attr_accessor :abs, :ord , :val

  #A la creation d'une case : abscisse/ordonnée/nom correspondant
  def initialize(abs, ord)
    @abs = abs
    @ord = ord
    @case_name = "#{abs+1}#{convert_ord_to_letter(ord)}"
    @val = 0
  end

  # Convertir les ordonnées en lettre afin de nommer correctement une case
  def convert_ord_to_letter(int)
    alphabet = ("A".."Z").to_a
    return alphabet[int]
  end

  # Définir le statut de la case [X] [O] [ ]
  def case_to_x()
    @val = 1 # [X] = 1
  end
  def case_to_o()
    @val = 2 # [O] = 2
  end
  def case_to_empty()
    @val = 0 # [ ] = 0
  end

 def case_display()
   if @val == 0
    print "| |"
  elsif @val == 2
    print "|O|"
  elsif @val == 1
    print "|X|"
  end
end


end # End BoardCase



binding.pry


def perform

  # Créer un plateau
  board = Board.new

  game = Game.new

end
