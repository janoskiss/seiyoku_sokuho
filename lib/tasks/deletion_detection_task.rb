require "open-uri"

class Tasks::DeletionDetectionTask
  def self.execute
    now = Time.now

    Video.objects_of_deletion_detection(now).each do |video|
      context = Nokogiri.HTML(open(video.url))

      if context.css("#main h1.inlineError").present?
        video.destroy
      else
        video.update_attributes!(
          next_deletion_detection_at: Video.next_deletion_detection_at(now)
        )
      end
    end
  end
end
