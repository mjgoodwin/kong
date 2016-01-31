require 'gosu'

require_relative 'hero'

class GameWindow < Gosu::Window
  def initialize
    super 640, 560
    self.caption = "Donkey Kong"
    @background_image = Gosu::Image.new("media/level1-background.BMP", :tileable => true)

    @hero = Hero.new
  end

  def update
    if Gosu::button_down? Gosu::KbLeft
      @hero.move_left
    end

    if Gosu::button_down? Gosu::KbRight
      @hero.move_right
    end

    if Gosu::button_down? Gosu::KbSpace
      @hero.jump
    end
  end

  def draw
    @hero.draw
    @background_image.draw(0, 0, 0)
  end
end
