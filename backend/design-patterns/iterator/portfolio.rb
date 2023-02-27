# frozen_string_literal: true

class Account
  attr_reader :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

my_portfolio = Portfolio.new

my_portfolio.add_account(Account.new('David', 1000))
my_portfolio.add_account(Account.new('Tom', 5000))
my_portfolio.add_account(Account.new('Jony', 3000))

puts("Any account has balance greater than 2000 is #{my_portfolio.any? do |account|
  account.balance > 2000
end} statement")
puts("All account has balance greater than 2000 is #{my_portfolio.all? do |account|
  account.balance > 2000
end} statement")

# Sort the accounts by balance
my_portfolio.sort.each do |account|
  puts "#{account.name} has balance #{account.balance}"
end
