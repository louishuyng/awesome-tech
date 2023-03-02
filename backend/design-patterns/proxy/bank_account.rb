# frozen_string_literal: true

# This is the real class
class BankAccount
  attr_reader :balance, :owner_name

  def initialize(starting_balance = 0, owner_name = 'Louis')
    @balance = starting_balance
    @owner_name = owner_name
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end
