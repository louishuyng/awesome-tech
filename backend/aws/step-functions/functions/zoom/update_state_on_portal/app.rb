require 'date'

def lambda_handler(event:, context:)
  # TODO: implement
  {
    timestamp: DateTime.now.iso8601 # Timestamp of the when the transaction was completed
  }
end
