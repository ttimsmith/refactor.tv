class Admin::EpisodesController < Admin::BaseController
  before_filter :find_episode, except: [:index, :new, :create]
  def index
    @episodes = Episode.recent.all
  end

  def new
    @episode = Episode.new
    @episode.position = Episode.order('position ASC').last.position + 1
  end

  def create
    if @episode = Episode.create(params[:episode])
      redirect_to [:admin, @episode] and return
    end

    render :new
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
