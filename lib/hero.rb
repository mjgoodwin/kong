class Hero
  def initialize
    @image     = Gosu::Image.new("media/marioRightMove1.jpg")
    @x         = 100
    @y         = 449
    @x_vel     = 0
    @y_vel     = 0
    @hang_time = 0
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end

  def update
    if @hang_time > 0
      if @hang_time > 10
        @y_vel = -2
      else
        @y_vel = 2
      end
      @hang_time = @hang_time - 1
    end

    if @x < 92 && @x_vel < 0
      @x_vel = 0
    end

    if @x > 552 && @x_vel > 0
      @x_vel = 0
    end

    @x = @x + @x_vel
    @y = @y + @y_vel

    @x_vel = 0
    @y_vel = 0
  end

  def move_left
    @x_vel = -5
  end

  def move_right
    @x_vel = 5
  end

  def jump
    if @hang_time == 0
      @hang_time = 20
    end
  end
end
