# frozen_string_literal: true

require './bank_account'

# This is the proxy class
class BankAccountProxy
  def initialize(real_account)
    @real_account = real_account
  end

  def balance
    @real_account.balance
  end

  def deposit(amount)
    @real_account.deposit(amount)
  end

  def withdraw(amount)
    @real_account.withdraw(amount)
  end
end

account = BankAccount.new(100, 'Louis')

proxy = BankAccountProxy.new(account)
proxy.deposit(50)
proxy.withdraw(10)
puts "Balance is #{proxy.balance}"
