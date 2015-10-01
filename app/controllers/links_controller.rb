class LinksController < ApplicationController
  before_action :set_link, only: [:show, :destroy]
  # skip_before_action :verify_authenticity_token

  def index
    @links = Link.all
  end

  def show
  end

  def create
    @link = Link.new(origin: link_params[:origin])
    @link.build_statistic
    @link.save
    redirect_to :back
  end

  def destroy
    @link.destroy
    redirect_to :back
  end

  private

  def set_link
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
    else
      @link = Link.find(params[:id])
    end
  end

  def link_params
    params.require(:link).permit(:origin, :slug)
  end

end
