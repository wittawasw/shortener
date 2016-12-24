class V1::LinkSerializer < ActiveModel::Serializer
  cache key: 'links', expires_in: 3.hours
  attributes :id, :origin, :link

  has_one :statistic, serializer: ::V1::StatisticSerializer

  def link
    "#{Rails.application.secrets.base_url}" + object.slug
  end
end
