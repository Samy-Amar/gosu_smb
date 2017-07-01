# frozen_string_literal: true

require_relative 'base_character'
require_relative '../assets/mario/repository'

module Characters
  class Mario < Characters::BaseCharacter
    INITIAL_POSITION = {
      x: 0,
      y: 0,
    }.freeze

    def initialize
      @images = Assets::Mario::Repository
      @x = INITIAL_POSITION[:x]
      @y = INITIAL_POSITION[:y]

    end

    def update; end

    def draw
      Gosu::Image.new()
    end
  end
end
