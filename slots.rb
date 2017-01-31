class Slots
  attr_accessor :symbol
  def initialize(player)
    @player = player
    @symbol = %w( bar cherry pineapple apple skull )
    menu
  end

  def new_game
    @slot1 = @symbol.sample
    @slot2 = @symbol.sample
    @slot3 = @symbol.sample
    result
  end

  def result
    puts "#{@slot1} #{@slot2} #{@slot3}"
    if @slot1 == 'skull' && @slot2 == 'skull' && @slot3 == 'skull'
      puts "You lose!"
      @player.wallet.amount -= 100.00
      puts "Your total is now #{@player.wallet.amount}"
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
    puts "*** Slots ***"
    puts "1)Activate slots (costs $.50)"
    puts "2)Back to CASINO"
    choice = gets.chomp.to_i

    if choice == 1
      @player.wallet.vinny(0)
      @player.wallet.amount = @player.wallet.amount - 0.50
      new_game
    elsif choice == 2
      to_casino
      # go back to casino
    else
      puts"Please press 1 or 2"
      menu
    end
  end

  def to_casino
    Casino.menu(@player)
  end

end


  # while Slots
  # end
