require "open-uri"

class Tasks::CheckDeletionTask
  def self.execute
    Video.find_each do |video|
      context = Nokogiri.HTML(open(video.url))
      video.destroy if context.css("#main h1.inlineError").present?
    end
  end
end
