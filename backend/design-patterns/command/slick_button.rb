class SlickButton
  def initialize(command)
    @command = command
  end

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    puts 'Save'
  end
end

save_button = SlickButton.new(SaveCommand.new)
save_button.on_button_push
