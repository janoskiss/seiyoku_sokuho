class Video < ActiveRecord::Base
  acts_as_paranoid
	validates :url,
	  presence: true,
		uniqueness: true
	validates :thumbnail,
		presence: true
end
