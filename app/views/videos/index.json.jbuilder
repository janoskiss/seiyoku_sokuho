json.array!(@videos) do |video|
  json.extract! video, :id, :url, :deleted_at
  json.url video_url(video, format: :json)
end
