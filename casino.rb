require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'


class Casino
  # To Do: Hando multiple players
  # Hint: Think array
  attr_accessor :player

  def initialize
    puts 'Welcome to the Casino!'.colorize(:blue)
    @player = Player.new
    puts "What game do you want to play #{player.name}?"
    menu
    # show a casino game menu
    # let the player choose a game
    # initialize the new game passing the player as a parameter
  end

  def menu
    puts '*** Casino MENU ***'
  end
end

Casino.new
