module VideosHelper
  WINDOW_SIZE_MOBILE=1
  WINDOW_SIZE_PC=3

  def window_size
    mobile? ? WINDOW_SIZE_MOBILE : WINDOW_SIZE_PC
  end
end
