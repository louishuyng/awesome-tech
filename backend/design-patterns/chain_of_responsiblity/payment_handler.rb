class PaymentHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def call(price)
    successor ? successor.call(price) : error
  end

  private

  def success(message)
    puts message
  end

  def error
    puts 'You are poor, go away!'
  end
end
