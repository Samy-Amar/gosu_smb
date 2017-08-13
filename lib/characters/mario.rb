# frozen_string_literal: true

require_relative 'base_character'
require_relative '../assets/mario/repository'

module Characters
  # Manages the mario character -
  # Mario-specific movement and actions, as well as assets
  class Mario < Characters::BaseCharacter
    def initial_position
      {
        x: 0,
        y: 250,
      }.freeze
    end

    SPRITE_PATH = 'lib/assets/mario/tmp_mario_1.jpg'

    def initialize
      set_speed_and_movement_defaults
      @image = Gosu::Image.new(SPRITE_PATH)
      @x = initial_position[:x]
      @y = initial_position[:y]
    end

    def update
      manage_movement
    end

    def draw
      @image.draw_rot(@x, @y, 1, 0)
    end

    private

    def manage_movement
      if Gosu.button_down? Gosu::KbRight
        move_right
      elsif Gosu.button_down? Gosu::KbLeft
        move_left
      end
      manage_jump if Gosu.button_down?(Gosu::KbUp) || @jumping
    end

    def set_speed_and_movement_defaults
      @base_speed = 3
      @acceleration_factor = 0
      @acceleration_update_factor = 1
      @max_acceleration_factor = 10
      @max_jump_height = 10
    end
  end
end
