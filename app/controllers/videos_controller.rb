class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.scoped.page params[:page]
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end
end
