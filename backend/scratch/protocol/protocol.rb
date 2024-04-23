require 'socket'
require 'thread'
require 'timeout'

class Protocol
  def initialize
    @server = TCPServer.new 3000
    @clients = []
    @mutex = Mutex.new
  end

  def start
    loop do
      Thread.start(@server.accept) do |client|
        @mutex.synchronize do
          @clients << client
        end

        loop do
          main_process(client)
        rescue Timeout::Error
          client.puts 'You are too slow!'
        end
      end
    end
  end

  def main_process(client)
    Timeout.timeout(100) do
      message = client.gets
      if message.nil?
        client.close
        @mutex.synchronize do
          @clients.delete(client)
        end
        break
      end

      @mutex.synchronize do
        @clients.each do |c|
          process_message(c, message)
        end
      end
    end
  end

  def process_message(c, message)
    # Split message as array
    message = message.split(' ')

    action = message[0]
    actor = message[1]

    case action
    when 'FUCK'
      c.puts 'You thật mất dạy'
      c.puts "You ko có đc #{actor} mô"
    else
      c.puts 'See you ngày mai'
    end
  end
end

Protocol.new.start
