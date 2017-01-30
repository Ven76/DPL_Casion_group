require 'pry'
require 'colorize'
require 'artii'
require_relative 'player'
require_relative 'deck'
require_relative 'high_low'
require_relative 'slots'


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
    puts '*** CASINO MENU ***'
    puts '1) High Low'
    puts '2) Slots'
    user_input = gets.chomp.to_i

    if user_input == 1
      High.new
    elsif user_input == 2
      Slots.new(@player)
    else
      puts 'naw, chhose again'
      menu
    end
  end
end



Casino.new

# while true
# end

#deck.cards.each do |card|
