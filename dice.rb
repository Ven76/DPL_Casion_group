require 'pry'

class Dice

  attr_accessor :player, :wallet

 def initialize(player)
   @player = player
   puts '*** welcome to war dice ***'
   puts 'A dollar A roll, high number wins'
   puts 'type roll to play or exit to leave'
    user_input = gets.chomp
   if user_input == 'roll'
     roll
   elsif user_input == 'exit'
    to_casino
   else
    puts 'invalid'

   end
 end

 def roll
   @player.wallet.vinny(0)
   puts 'dealer rolled'
   @die1 = 1 + rand(6)
   puts @die1
   puts 'you rolled'
   @die2 = 1 + rand(6)
   puts @die2
   check(@die1, @die2)
 end

 def check(die1, die2)
  if die1 > die2
    puts 'you lose'
    @player.wallet.amount -= 1
  elsif die1 == die2
  puts 'its a tie, rerolling'
   roll
 else
   puts 'you win'
     @player.wallet.amount += 1
  end
   puts "your wallet #{@player.wallet.amount}"
   puts 'roll again or exit?'
   input = gets.chomp
  if input == 'roll' || input == 'roll again'
     roll
  else
     to_casino

   end
 end





 def to_casino
   Casino.menu(@player)
 end
end
