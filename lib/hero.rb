class Hero
  def initialize
    @image = Gosu::Image.new("media/marioRightMove1.jpg")
    @x = 100
    @y = 449
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
