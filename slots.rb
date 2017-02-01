class Slots
  attr_accessor :symbol
  def initialize(player)
    @player = player
    @symbol = %w( bar cherry apple skull bomb )
    menu
  end
  def new_game
    @slot1 = @symbol.sample
    @slot2 = @symbol.sample
    @slot3 = @symbol.sample
    result
  end

  def result
    puts "#{@slot1} #{@slot2} #{@slot3}".colorize(:yellow)
    if @slot1 == 'skull' && @slot2 == 'skull' && @slot3 == 'skull'
      puts "You lose!"
      @player.wallet.amount -= 100.00
      puts "Your total is now #{@player.wallet.amount}"
    elsif @slot1 == 'bomb' && @slot2 == 'bomb' && @slot3 == 'bomb'
      explosion
    elsif @slot1 == @slot2 && @slot2 == @slot3
      puts "You win!"
      # @amount = @amount + 50.00
      @player.wallet.amount += 50.00
      puts "Your total is now #{@player.wallet.amount}"
    elsif @slot1 == 'bar' && @slot2 == 'bar' && @slot3 == 'bar'
      puts "WINN!"
      @player.wallet.amount += 100.00
      "Your total is #{@player.wallet.amount}"
    else
      puts "Your total is #{@player.wallet.amount}"
    end
    menu
  end

  def menu
    puts "*** Slots ***".colorize(:blue)
    puts "1)Activate slots (costs $.50)"
    puts "2)Back to CASINO"
    puts "3)What does this button do?"
    choice = gets.chomp.to_i

    if choice == 1
      @player.wallet.vinny(0)
      @player.wallet.amount = @player.wallet.amount - 0.50
      new_game
    elsif choice == 2
      to_casino
      # go back to casino
    elsif choice == 3
      explosion
    else
      puts"Please press 1 or 2"
      menu
    end
  end

  def explosion
    puts "BOOM! The machine blows up in your face".colorize(:red)
    puts "and you are liable for damages. You lose".colorize(:red)
    puts "$5000.".colorize(:red)
    @player.wallet.amount -= 5000
    puts "Your total is #{@player.wallet.amount}"
    to_casino
  end

  def to_casino
    Casino.menu(@player)
  end

end


  # while Slots
  # end
