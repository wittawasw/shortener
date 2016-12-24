class V1::StatisticSerializer < ActiveModel::Serializer
  cache key: 'statistics', expires_in: 3.hours
  attributes :id, :visit, :unique_visit

  belongs_to :link, serializer: ::V1::LinkSerializer
end
