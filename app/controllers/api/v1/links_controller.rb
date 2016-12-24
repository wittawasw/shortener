class Api::V1::LinksController < Api::V1::ApiController
  before_action :set_link, only: [:show, :destroy]
  before_action :verify_authenticity_token, only: [:create, :destroy]

  def index
    @links = Link.eager_load(:statistic)
                 .order(created_at: :desc)
                 .page(params[:page] || 1)
                 .per(10)
    render json: @links, each_serializer: ::V1::LinkSerializer
  end

  def show
    render json: @link, serializer: ::V1::LinkSerializer
  end

  def create
    unless link_params[:origin].blank?
      @link = Link.new(origin: link_params[:origin])
      @link.build_statistic
      @link.save
      render json: @link, serializer: ::V1::LinkSerializer
    else
      render json: { status: "error", message: "origin's invalid"},
             status: :unprocessable_entity
    end
  end

  def destroy
    if @link.destroy
      render json: { status: "success",
                     message: "Successfully destroyed Link##{params[:id]}"},
             status: :ok
    else
      render json: { status: "error", message: "Link's cannot be destroyed"},
             status: :unprocessable_entity
    end
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:origin, :slug)
  end
end
