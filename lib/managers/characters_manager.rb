# frozen_string_literal: true

require_relative 'base_manager'
require_relative '../characters/mario'

module Managers
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
