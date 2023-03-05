# frozen_string_literal: true

Dir[File.expand_path('non_terminals/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

Dir[File.expand_path('terminals/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

# Parser for the query language
class Parser
  def initialize(text)
    @tokens = text.scan(/\(|\)|[\w.*]+/)
  end

  def next_token
    @tokens.shift
  end

  def expression
    token = next_token
    return nil if token.nil?

    if token == '('
      result = expression
      raise 'Expected )' unless next_token == ')'

      return result
    end

    return All.new if token == 'all'
    return Writable.new if token == 'writable'
    return Bigger.new(next_token.to_i) if token == 'bigger'
    return FileName.new(next_token) if token == 'filename'
    return Not.new(expression) if token == 'not'
    return And.new(expression, expression) if token == 'and'
    return Or.new(expression, expression) if token == 'or'

    raise "Unexpected token: #{token}"
  end
end

parser = Parser.new 'and (or(bigger 1024)(filename *.mp3)) writable'
ast = parser.expression
puts ast.evaluate('test_dir')
