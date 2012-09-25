class EpisodesController < ApplicationController
  def index
    @episodes = Episode.published.recent
  end

  def show
    position = params[:id]

    # Ensure it's actually zero and not the string parsing incorrectly
    unless position.to_i.to_s == params[:id]
      raise ActionController::RoutingError.new('Not Found')
    end

    @episode = Episode.published.find_by_position(position)
  end
end
