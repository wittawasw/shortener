class AccessesController < ApplicationController
  def new
    @link = Link.where(slug: params[:slug]).first
    if @link
      NewAccessJob.perform_later(ip: request.remote_ip, link_id: @link.id)
      redirect_to @link.origin
    else
      redirect_to root_path
    end 
  end
end
