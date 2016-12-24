class V1::AccessSerializer < ActiveModel::Serializer
  cache key: 'accesses', expires_in: 3.hours
  attributes :id, :ip, :datetime

  def datetime
    object.created_at
  end
end
