require './payment_handler'

class VoucherPaymentHandler < PaymentHandler
  def call(price)
    if price < 20
      success('You have paid with voucher')
    else
      super(price)
    end
  end
end
