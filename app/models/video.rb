class Video < ActiveRecord::Base
  BASE_URL    = "http://www.xvideos.com/"
  CODE_PREFIX = "video"

  acts_as_paranoid

  validates :code,      presence: true, uniqueness: true
  validates :thumbnail, presence: true
  validates :title,     presence: true
  validates :next_deletion_detection_at, presence: true

  default_scope -> { order("created_at DESC") }

  paginates_per 16

  class << self
    def objects_of_deletion_detection(now)
      self
       .where("next_deletion_detection_at < ?", now)
       .reorder("next_deletion_detection_at ASC")
    end

    def next_deletion_detection_at(now)
      now + deletion_detection_interval + diffuseness_of_deletion_detection
    end

    def deletion_detection_interval
      24.hours
    end

    def diffuseness_of_deletion_detection
      rand(24.hours)
    end
  end

  def url
    BASE_URL + CODE_PREFIX + self.code
  end
end
