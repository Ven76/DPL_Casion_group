require 'pry'
require 'colorize'
require 'artii'
require 'deploy_sounds'
require_relative 'player'
require_relative 'deck'
require_relative 'high_low'
require_relative 'slots'
require_relative 'dice'


class Casino
  # To Do: Hando multiple players
  # Hint: Think array
  attr_accessor :player

  def initialize
    puts 'Welcome to the Casino!'.colorize(:red)
    DeploySounds.play
    @player = Player.new
    puts "What game do you want to play #{player.name}?"

    Casino.menu(@player)
    # show a casino game menu
    # let the player choose a game
    # initialize the new game passing the player as a parameter
  end

  def self.menu(player)
    puts "*** CASINO MENU ***".colorize(:yellow)
    puts '1) High Low'
    puts '2) Slots'
    puts '3) War Dice'
    puts '4) Exit Casino'
    user_input = gets.chomp.to_i

    if user_input == 1
      High.new(player)
    elsif user_input == 2
      Slots.new(player)
    elsif user_input == 3
      Dice.new(player)
    elsif user_input == 4
      puts "Thank you for playing".colorize(:green)
      exit(0)
    else
      puts 'naw, choose again'
      menu
    end
  end
end



Casino.new

# while true
# end

#deck.cards.each do |card|
