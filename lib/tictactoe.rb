require 'pry'
require 'rubocop'


class Game # Une partie contient des joueurs et un plateau

  @players = []

end # End Game


class Player # Chaque joueur possède un nom et un score
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end
end # End Player


class Board # Un plateau contient des cases

  def initialize # A la creation un plateau est vide
    @board_cases = []
  end

  # Remplir un plateau avec des cases
  def fulfill_board(x=3, y=x)
    x.times do |x|
      y.times do |y|
        board_case = BoardCase.new(x,y)
        @board_cases << board_case
      end
    end
  end

end # End Board



class BoardCase # Les cases d'un plateau
  attr_accessor :abs, :ord , :val

  #A la creation d'une case : abscisse/ordonnée/nom correspondant
  def initialize(abs, ord)
    @abs = abs
    @ord = ord
    @name = "#{abs+1}#{convert_ord_to_letter(ord)}"
    @value = 0
  end

  # Convertir les ordonnées en lettre afin de nommer correctement une case
  def convert_ord_to_letter(int)
    alphabet = ("A".."Z").to_a
    return alphabet[int]
  end

  # Définir le statut de la case [X] [O] [ ]
  def case_to_x()
    @value = 1 # [X] = 1
  end
  def case_to_o()
    @value = 2 # [O] = 2
  end
  def case_to_empty()
    @value = 0 # [ ] = 0
  end

end # End BoardCase



binding.pry


def perform

  # Créer un plateau
  board = Board.new

  game = Game.new

end
