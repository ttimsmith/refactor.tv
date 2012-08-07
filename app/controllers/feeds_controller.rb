class FeedsController < ApplicationController
  def show
    @episode_files = EpisodeFile.where(file_type: params[:file_type])
    render template: 'feeds/podcast', format: 'xml'
  end
end
