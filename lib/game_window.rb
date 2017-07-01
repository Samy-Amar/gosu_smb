# frozen_string_literal: true

require_relative 'managers/characters_manager'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480 # Window size
    self.caption = 'Super Mario Bros. 1 - The Gosu Port' # Window title
    @characters_manager = Managers::CharactersManager.new
  end

  private

  def update
    @characters_manager.update
  end

  def draw
    @characters_manager.draw
  end
end
