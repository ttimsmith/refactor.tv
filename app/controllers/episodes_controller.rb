class EpisodesController < ApplicationController
  def index
    @episodes = Episode.published.recent
  end
  
  def show
    @episode = Episode.published.find_by_position(params[:id])
  end
end
