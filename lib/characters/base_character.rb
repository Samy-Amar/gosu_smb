# frozen_string_literal: true

module Characters
  # Repository for methods that can be reused across all characters
  class BaseCharacter
    private

    #############################################
    # HORIZONTAL MOVEMENT
    #############################################
    def move_right
      horizontal_move(:right, 1)
    end

    def move_left
      horizontal_move(:right, -1)
    end

    def horizontal_move(direction, pos_or_neg)
      reset_acceleration_factor_unless(direction)
      @current_moving_direction = direction
      @x += calculate_moving_speed(pos_or_neg)
      update_acceleration_factor
    end

    def calculate_moving_speed(pos_or_neg)
      pos_or_neg * (1 + @acceleration_factor)
    end

    def reset_acceleration_factor_unless(direction)
      @acceleration_factor = 0 unless @current_moving_direction == direction
    end

    def update_acceleration_factor
      return unless @acceleration_factor < @max_acceleration_factor
      @acceleration_factor += @acceleration_update_factor
    end

    #############################################
    # VERTICAL MOVEMENT
    #############################################
    def manage_jump
      return if last_jumped_not_too_long_ago
      @jumping = true
      if should_go_up?
        @y -= 1
      else
        @y += 1
      end
      update_jump_direction_if_peak
      set_not_jumping_if_on_ground
    end

    def last_jumped_not_too_long_ago
      @last_jump &&
        @last_jump.last_tick > (GameWindow.current_tick - @minimum_ticks_between_jumps)
    end

    def should_go_up?
      @jump_direction != :down &&
        @y < @max_jump_height + initial_position[:y]
    end

    def update_jump_direction_if_peak
      if @jump_direction == :up &&
         @y >= @max_jump_height + initial_position[:y]
        @jump_direction = :down
      end
    end

    def set_not_jumping_if_on_ground
      if @y == initial_position[:y]
        @jumping = false
        @last_jump = GameWindow.current_tick
      end
    end
  end
end
