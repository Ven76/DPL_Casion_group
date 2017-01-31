#Get a new deck
#Bring player to table
#Dealer draws card
#Dealer draws guess card
require 'pry'
require_relative 'deck'

class High
  attr_accessor :player
  def initialize(player)
    @player = player
    @deck = Deck.new.cards
    menu
  end



  def menu
    puts "** Gettin' High Card **"
    puts "1) Deal card"
    puts "2) Back to CASINO"
    play_game = gets.chomp.to_i

    if play_game == 1
      deal
    elsif play_game == 2
      to_casino
    else
      puts 'Try hitting 1 or 2'
      menu
    end
  end

  def deal
    @deck.shuffle
    @deal = @deck.sample
    puts "#{@deal.color} #{@deal.rank} of #{@deal.suit}"
    wager
  end

  def wager
    @player.wallet.vinny(0)
    puts "How much money you bettin'?"
    @user_bet = gets.to_f
    @player.wallet.amount -= @user_bet
    @card_guess = @deck.sample
    guess
  end

  def guess
    card_guess = @deck.sample
    puts "Is the next card High or Low?"
    user_input = gets.chomp
    puts "#{@card_guess.color} #{@card_guess.rank} of #{@card_guess.suit}"

    if @deal.rank > @card_guess.rank && user_input == 'High'
      puts 'You lose, you suck.'
      menu
    elsif @deal.rank < @card_guess.rank && user_input == 'High'
      puts 'YOU WIN!'
      @player.wallet.amount = @player.wallet.amount + @user_bet * 2
      puts "You now have #{@player.wallet.amount}"
      menu
    elsif @deal.rank < @card_guess.rank && user_input == 'Low'
      puts "Too bad! You lose"
      menu
    elsif @deal.rank > @card_guess.rank && user_input == 'Low'
      puts 'WINNING!'
        @player.wallet.amount = @player.wallet.amount + @user_bet * 2
        puts "You now have #{@player.wallet.amount}"
        menu
      else
        puts 'Please write High or Low'
        guess
      end
    end

    def to_casino
      Casino.menu(@player)
    end

  end




    #Deck.new
    #  deck.cards.each do |card|
    #end
#  end
#end
