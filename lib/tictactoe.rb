require 'pry'
require 'rubocop'


class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end
end



class Board
  def create_board(n)
    

  end
end


class BoardCase
  attr_accessor :abs, :ord , :val

#définir l'emplacement de la case (absysse/ordonnée)
  def initialize(abs, ord)
    @abs = abs
    @ord = ord
    @value = 0
  end

#définir le statut de la case [X] [O] [ ]
  def case_to_x()
    @value = 1 # [X] = 1
  end
  def case_to_o()
    @value = 2 # [O] = 2
  end
  def case_to_empty()
    @value = 0 # [ ] = 0
  end
end


class Game


end


def perform

#créer un plateau
 board = Board.new



  game = Game.new
