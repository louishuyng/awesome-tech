# frozen_string_literal: true

require './bank_account'

# The AccountProxy class is a proxy for the BankAccount class.
class AccountProxy
  def initialize(real_account)
    @subject = real_account
  end

  def method_missing(name, *args)
    puts "Delegating #{name} message to subject."
    @subject.send(name, *args)
  end
end

ap = AccountProxy.new(BankAccount.new(100))

ap.deposit(25)
ap.withdraw(50)
puts("account balance is now: #{ap.balance}")
