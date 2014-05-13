class VideosController < ApplicationController
  def index
    @videos = Video.recent.page(params[:page])
  end

  def show
    @video = Video.find(params[:id])
  end
end
