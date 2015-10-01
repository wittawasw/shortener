require 'rails_helper'

RSpec.describe V1::StatisticSerializer, :type => :serializer do

  fixtures :statistics

  context 'Individual Resource Representation' do

    let(:google_statistic) { statistics(:google_statistic) }
    let(:serializer) { ::V1::StatisticSerializer.new(google_statistic) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject).to match_response_serializer 'statistic', 'v1' }

  end

end
