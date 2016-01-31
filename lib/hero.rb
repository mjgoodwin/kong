class Hero
  def initialize
    @image = Gosu::Image.new("media/marioRightMove1.jpg")
    @x = 100
    @y = 449
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
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
    @y = @y - 5
  end
end
