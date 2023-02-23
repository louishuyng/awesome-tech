# frozen_string_literal: true

require './employee'
require './tax_man'
require './payroll'

fred = Employee.new('Fred', 'Crane Operator', 30_000.0)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary = 90_000.0
