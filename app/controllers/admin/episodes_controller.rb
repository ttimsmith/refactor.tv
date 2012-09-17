class Admin::EpisodesController < Admin::BaseController
  before_filter :find_episode, except: [:index, :new, :create]
  def index
    @episodes = Episode.recent.all
  end

  def update
    if @episode.update_attributes(params[:episode])
      redirect_to [:admin, @episode]
    else
      render :edit
    end
  end

private

  def find_episode
    @episode = Episode.find_by_position(params[:id])
  end
end
