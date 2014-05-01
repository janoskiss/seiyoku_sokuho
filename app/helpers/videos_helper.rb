module VideosHelper
  module WindowSize
    MOBILE = 1
    PC     = 3
  end

  def window_size
    mobile? ? WindowSize::MOBILE : WindowSize::PC
  end
end
