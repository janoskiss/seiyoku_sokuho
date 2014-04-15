class VideosController < ApplicationController
  def index
    @videos = Video.page params[:page]
  end
end
