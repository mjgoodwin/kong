class Hero
  def initialize
    @image     = Gosu::Image.new("media/marioRightMove1.jpg")
    @x         = 100
    @y         = 449
    @hang_time = 0
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end

  def update
    if @hang_time > 0
      if @hang_time > 10
        @y = @y - 2
      else
        @y = @y + 2
      end
      @hang_time = @hang_time - 1
    end
  end

  def move_left
    if @x > 91
      @x = @x - 5
    end
  end

  def move_right
    if @x < 551
      @x = @x + 5
    end
  end

  def jump
    if @hang_time == 0
      @hang_time = 20
    end
  end
end
