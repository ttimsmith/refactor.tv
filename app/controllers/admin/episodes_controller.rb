class Admin::EpisodesController < Admin::BaseController
  before_filter :find_episode, except: [:index, :new, :create]
  def index
    @episodes = Episode.recent.all
  end

private

  def find_episode
    @episode = Episode.find_by_position(params[:id])
  end
end
