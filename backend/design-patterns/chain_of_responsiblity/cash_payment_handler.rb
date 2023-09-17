require './payment_handler'

class CashPaymentHandler < PaymentHandler
  def call(price)
    if price < 100
      success('You have paid with cash')
    else
      super(price)
    end
  end
end
