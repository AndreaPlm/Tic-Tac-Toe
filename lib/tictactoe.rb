require 'pry'
require 'rubocop'


class Game # Une partie contient des joueurs et un plateau

  def initialize
    @board = Board.new
    puts "Enter player 1"
    @player1 = Player.new(gets.chomp)
    puts "Enter player 2"
    @player2 = Player.new(gets.chomp)
  end

  def play

#  unless check_winner == 1 || check_winner == 2
    @board.display
    nb_turn = 0
    #4.times do
  while check_winner == 0 || nb_turn != 9 do
      #PLayer1 joue
      nb_turn +=1
      puts "#{@player1.player_name} to play ! What is your move ?"
      board_case = gets.chomp
      @board.board_cases.each do |elem|
        if elem.case_name == board_case
          elem.val = 1
          break
        end
      end
      @board.display

      if check_winner == 1 then puts "#{@player1.player_name} a gagné !" end
      if check_winner == 2 then puts "#{@player2.player_name} a gagné !" end
      if check_winner == 0 && nb_turn == 9 then puts "It's a toe !" end


      #PLayer2 joue
      nb_turn +=1
      puts "#{@player2.player_name} to play ! What is your move ?"
      board_case = gets.chomp
      @board.board_cases.each do |elem|
        if elem.case_name == board_case
          elem.val = -1
          break
        end
      end
      @board.display

      if check_winner == 1 then puts "#{@player1.player_name} a gagné !" end
      if check_winner == 2 then puts "#{@player2.player_name} a gagné !" end

    end
  end


  def check_winner
    winner = 0
# Verifie les lignes (attention aux yeux....)
# Ligne 1
    sum = 0
    3.times do |i|
      sum += @board.board_cases[i].val
    end
    if sum == 3 then
      winner = 1
      return winner
    elsif sum == -3 then
      winner = 2
      return winner
    end
# Ligne 2
    sum = 0
    3.times do |i|
      sum += @board.board_cases[i+3].val
    end
    if sum == 3 then
      winner = 1
      return winner
    elsif sum == -3 then
      winner = 2
      return winner
    end
# Ligne 3
    sum = 0
    3.times do |i|
      sum += @board.board_cases[i+6].val
    end
    if sum == 3 then
      winner = 1
      return winner
    elsif sum == -3 then
      winner = 2
      return winner
    end

# Verifie les colonnes (et c'est pas fini....)
    # Colonne 1
        sum = 0
        3.times do |i|
          sum += @board.board_cases[i*3].val
        end
        if sum == 3 then
          winner = 1
          return winner
        elsif sum == -3 then
          winner = 2
          return winner
        end
    # Colonne 2
        sum = 0
        3.times do |i|
          sum += @board.board_cases[i*3+1].val
        end
        if sum == 3 then
          winner = 1
          return winner
        elsif sum == -3 then
          winner = 2
          return winner
        end
    # Colonne 3
        sum = 0
        3.times do |i|
          sum += @board.board_cases[i*3+2].val
        end
        if sum == 3 then
          winner = 1
          return winner
        elsif sum == -3 then
          winner = 2
          return winner
        end

  # ET CEST PARTI POUR LES DIAGONAAAAAAAAAALES (coucou il est 21h45)

  # Diagonale 1
      sum = 0
      3.times do |i|
        sum += @board.board_cases[i*3+i].val
      end
      if sum == 3 then
        winner = 1
        return winner
      elsif sum == -3 then
        winner = 2
        return winner
      end
  # Diagonale 2
      sum = 0
      3.times do |i|
        sum += @board.board_cases[(i+1)*3-(i+1)].val
      end
      if sum == 3 then
        winner = 1
        return winner
      elsif sum == -3 then
        winner = 2
        return winner
      end
  return winner


  end #end check winner


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
    @val = -1 # [O] = 2
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
  elsif @val == -1
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
