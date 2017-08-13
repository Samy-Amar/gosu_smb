# frozen_string_literal: true

require_relative 'managers/characters_manager'

# Manages the whole game -
# Goal is to keep it as clean as possible
# and call methods from here.
# You should have a fair idea of the order the game updates from here
class GameWindow < Gosu::Window
  attr_writer :current_tick
  def initialize
    super 640, 480 # Window size
    @current_tick = 0
    self.caption = 'Super Mario Bros. 1 - The Gosu Port' # Window title
    @characters_manager = Managers::CharactersManager.new
  end

  private

  def update
    @current_tick += 1
    @characters_manager.update
  end

  def draw
    @characters_manager.draw
  end
end
