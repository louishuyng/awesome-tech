# frozen_string_literal: true

require 'drb/drb'

math_service = DRbObject.new_with_uri('druby://localhost:3030')
sum = math_service.add(2, 2)
puts "Sum is #{sum}"
