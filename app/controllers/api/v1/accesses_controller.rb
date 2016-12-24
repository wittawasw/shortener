class Api::V1::AccessesController < ApplicationController
  def index
    @accesses = Access.where(link_id: params[:link_id]).page(params[:page] || 1).per(10)
    render json: @accesses, each_serializer: ::V1::AccessSerializer
  end
end
