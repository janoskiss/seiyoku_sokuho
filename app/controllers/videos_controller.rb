class VideosController < ApplicationController
  def index
    @videos = Video.scoped.page params[:page]
  end
end
