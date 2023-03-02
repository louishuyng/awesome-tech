# frozen_string_literal: true

require_relative './bank_account'

# This is the proxy class
class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def deposit(amount)
    check_access
    @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def balance
    check_access
    @subject.balance
  end

  def check_access
    return unless @owner_name != @subject.owner_name

    raise "Illegal access: #{@owner_name} cannot access account."
  end
end

bank_account = BankAccount.new(100, 'Louis')

account = AccountProtectionProxy.new(bank_account, 'Louis') # Valid case
account.deposit(50)
puts "Balance is #{account.balance}"

account = AccountProtectionProxy.new(bank_account, 'Jane')
account.deposit(50)
