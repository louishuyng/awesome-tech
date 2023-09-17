require './payment_handler'

class CardPaymentHandler < PaymentHandler
  def call(price)
    if price < 200
      success('You have paid with card')
    else
      super(price)
    end
  end
end
