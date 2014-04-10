class Video < ActiveRecord::Base
  BASE_URL     = "http://www.xvideos.com/"
  VIDEO_PREFIX = "video"

  acts_as_paranoid

  validates :code,      presence: true, uniqueness: true
  validates :thumbnail, presence: true
  validates :title,     presence: true

  def url
    BASE_URL + VIDEO_PREFIX + code
  end
end
