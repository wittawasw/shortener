class NewAccessJob < ActiveJob::Base
  queue_as :access

  def perform(ip:, link_id:)
    Access.create(ip: ip, link_id: link_id)
  end
end
