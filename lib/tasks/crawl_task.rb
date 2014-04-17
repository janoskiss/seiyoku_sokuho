require "open-uri"
require "uri"
require "nokogiri"

class Tasks::CrawlTask
  CRAWL_PATH = "tags/japanese/s:rating/m:allduration/d:week"

  def self.execute
    endpoint = URI.join(Video::BASE_URL, CRAWL_PATH)
    context  = Nokogiri.HTML(open(endpoint))

    _css = "#content .mozaique .thumbBlock .thumbInside"
    # To use map!, calling to_a
    thumb_insides = context.css(_css).to_a
    thumb_insides.map! do |thumb_inside|
      script = thumb_inside.css("script")
      script.present? ? Nokogiri.parse(script.to_html) : thumb_inside
    end

    thumb_insides.each do |thumb_inside|
      path = thumb_inside.css(".thumb a").attribute("href").text

      Video.create(
        code:      path.slice(/(?<=\/video)\d+/),
        thumbnail: thumb_inside.css(".thumb a").children.attribute("src").text,
        title:     thumb_inside.css("p a").children.text,
        next_deletion_detection_at: Video.next_deletion_detection_at(Time.now)
      )
    end
  end
end
