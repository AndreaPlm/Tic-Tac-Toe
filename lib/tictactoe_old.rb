require 'pry'
require 'rubocop'


class Game # Une partie contient des joueurs et un plateau

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
    @board_cases = {}
  end

  # Remplir un plateau avec des cases
  def fill(x=3, y=x)
    @length = x
    @height = y

    alphabet = ("A".."Z").to_a
    y.times do |y|
      x.times do |x|
        @board_cases[alphabet[y] + "#{x+1}"] = BoardCase.new(x,y)
      end
    end
  end

  # Vider un plateau
  def empty()
    @board_cases = []
  end

  # Afficher un plateau
  def display()
    x = 0 # Compteur pour le retour à la ligne
    @board_cases.each do |board_case|
      to_display = board_case.case_display
      x +=1
      if x == @length
        to_display = to_display + "\n"
        x=0
      end
      print to_display
    end
  end

end # End Board



class BoardCase # Les cases d'un plateau
  attr_accessor :case_name, :abs, :ord , :val

  #A la creation d'une case : abscisse/ordonnée/nom correspondant
  def initialize(abs, ord)
    @abs = abs
    @ord = ord
    @case_name = "#{convert_ord_to_letter(ord)}#{abs+1}"
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

  # Renvoyer la valeur de la case
  def case_value()
    return value = self.val
  end

  def case_display()
   if @val == 0
    "| |"
  elsif @val == 2
    "|O|"
  elsif @val == 1
    "|X|"
  end
end


end # End BoardCase



binding.pry


def perform

  # Créer un plateau
  board = Board.new

  game = Game.new

end
