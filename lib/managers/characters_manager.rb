# frozen_string_literal: true

require_relative 'base_manager'
require_relative '../characters/mario'

module Managers
  # Manages basic character methods that will be reused -
  # Movement, life, death, etc.
  class CharactersManager < Managers::BaseManager
    def initialize
      @mario = Characters::Mario.new
    end

    def update
      @mario.update
    end

    def draw
      @mario.draw
    end
  end
end
