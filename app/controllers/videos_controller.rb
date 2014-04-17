class VideosController < ApplicationController
  def index
    @videos = Video.recent.page(params[:page])
  end
end
