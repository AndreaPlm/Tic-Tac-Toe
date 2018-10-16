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

  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

    attr_accessor :val, :case_number

    def initialize(val, nb)
      @val = val
      @case_number = nb
    end

    def create_cases()
      a1 = BoardCase.new(0,1)
      a2 = BoardCase.new(0,2)
      a3 = BoardCase.new(0,3)
      b1 = BoardCase.new(0,4)
      b2 = Boardcase.new(0,5)
      b3 = Boardcase.new(0,6)
      c1 = Boardcase.new(0,7)
      c2 = Boardcase.new(0,8)
      c3 = Boardcase.new(0,9)
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
