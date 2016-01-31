class Hero

  MOVE_LEFT_IMAGES = [
    Gosu::Image.new("media/marioLeftMove1.jpg"),
    Gosu::Image.new("media/marioLeftMove2.jpg"),
    Gosu::Image.new("media/marioLeftMove3.jpg")
  ]

  MOVE_RIGHT_IMAGES = [
    Gosu::Image.new("media/marioRightMove1.jpg"),
    Gosu::Image.new("media/marioRightMove2.jpg"),
    Gosu::Image.new("media/marioRightMove3.jpg")
  ]

  def initialize
    @image        = Gosu::Image.new("media/marioRightMove1.jpg")
    @x            = 100
    @y            = 449
    @x_vel        = 0
    @y_vel        = 0
    @hang_time    = 0
    @facing_right = true
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end

  def update
    if floating?
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

    move

    @x_vel = 0
    @y_vel = 0
  end

  def move
    @x = @x + @x_vel
    @y = @y + @y_vel
    update_image
  end

  def update_image
    if floating?
      if @facing_right
        @image = Gosu::Image.new("media/marioRightFloat.jpg")
      else
        @image = Gosu::Image.new("media/marioLeftFloat.jpg")
      end
    elsif @x_vel != 0
      if @facing_right
        @image = move_right_image
      else
        @image = move_left_image
      end
    else
      if @facing_right
        @image = Gosu::Image.new("media/marioRightMove1.jpg")
      else
        @image = Gosu::Image.new("media/marioLeftMove1.jpg")
      end
    end
  end

  def move_left_image
    image_index = Gosu::milliseconds / 100 % MOVE_LEFT_IMAGES.size
    @image = MOVE_LEFT_IMAGES[image_index]
  end

  def move_right_image
    image_index = Gosu::milliseconds / 100 % MOVE_RIGHT_IMAGES.size
    @image = MOVE_RIGHT_IMAGES[image_index]
  end

  def floating?
    @hang_time > 0
  end

  def move_left
    @x_vel = -5
    @facing_right = false
  end

  def move_right
    @x_vel = 5
    @facing_right = true
  end

  def jump
    if @hang_time == 0
      @hang_time = 20
    end
  end

  def climb_up
    unless floating?
      @y_vel = -2
    end
  end

  def climb_down
    unless floating?
      @y_vel = 2
    end
  end

end
