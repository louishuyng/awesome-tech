# frozen_string_literal: true

require './string_io_adapter'

class String
  def ^(other)
    b1 = unpack('U*')
    b2 = other.unpack('U*')
    longest = [b1.length, b2.length].max
    b1 = [0] * (longest - b1.length) + b1
    b2 = [0] * (longest - b2.length) + b2
    b1.zip(b2).map { |a, b| a ^ b }.pack('U*')
  end
end

# Encrypts a file using a key
class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    until reader.eof?
      clear_char = reader.getc
      encrypted_char = clear_char ^ @key[key_index]
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

reader = File.open('message.txt')
writer = File.open('message.encrypted', 'w')

encrypter = Encrypter.new('my secret key')
encrypter.encrypt(reader, writer)

encrypter = Encrypter.new('XYZZY')
reader = StringIOAdapter.new('We attack at dawn')
writer = File.open('out.txt', 'w')
encrypter.encrypt(reader, writer)
