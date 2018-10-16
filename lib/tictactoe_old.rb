require 'pry'
require 'rubocop'


class Game # Une partie contient des joueurs et un plateau
  def initialize
    board = Board.new
    puts "Enter player 1"
    @player1 = Player.new(gets.chomp)
    puts "Enter player 2"
    @player2 = Player.new(gets.chomp)
  end

  def play
    unless check_winner
      puts "#{@player1.player_name} to play ! What is your move ?"
      board_case = gets.chomp
      board.board_cases.each do |elem|
        if elem.case_name == board_case
          elem.val = 1
          break
        end
      end
      check_winner
    end
  end




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

  def initialize(x=3, y=x) # A la creation un plateau est vide, on le rempli de cases vides
    @board_cases = []
    @length = x
    @height = y

    y.times do |y|
      x.times do |x|
        @board_cases << BoardCase.new(x,y)
      end
    end
  end


  # Vider un plateau
  def empty()
    @board_cases = []
  end

  # Afficher un plateau
  def display()
    alphabet = ("A".."Z").to_a
    x = 0 # Compteur pour le retour à la ligne
    y = 0 # Compteur pour les lettres en ordonnées

    print "  "
    @length.times do |i| # Print chiffres première ligne
      print " #{i+1} "
    end
    print "\n "

    @board_cases.each do |board_case|
      # Print les lettres (colonnes)
      if x % @length == 0
        print alphabet[y]
        y += 1
      end

      # Print les cases
      print board_case.to_s
      x +=1
      if x % @length == 0
        print "\n "
      end
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

  def to_s()
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
