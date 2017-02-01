class Wallet
    attr_accessor :amount

  def initialize(amount)
    @amount = amount
    vinny(0)
  end

  def vinny(amt)
    if @amount <= amt
      DeploySounds.play
      puts 'look pal, we aint got time for bums like you, come back when you got some money'.colorize(:green)
       exit(0)
    end
  end
end
