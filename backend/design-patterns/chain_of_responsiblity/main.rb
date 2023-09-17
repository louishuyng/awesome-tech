require './cash_payment_handler'
require './card_payment_handler'
require './voucher_payment_handler'

payment = VoucherPaymentHandler.new(CashPaymentHandler.new(CardPaymentHandler.new))

payment.call(100)
payment.call(70)
payment.call(120)
payment.call(300)
