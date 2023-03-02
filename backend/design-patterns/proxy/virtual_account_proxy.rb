# frozen_string_literal: true

require './bank_account'

# VirtualAccountProxy is a proxy for a VirtualAccount
class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def deposit(amount)
    s = subject
    s.deposit(amount)
  end

  def withdraw(amount)
    s = subject
    s.withdraw(amount)
  end

  def balance
    s = subject
    s.balance
  end

  def subject
    @subject || (@subject = @creation_block.call)
  end
end

account = VirtualAccountProxy.new { BankAccount.new(10) }
puts "Account balance: #{account.balance}"
