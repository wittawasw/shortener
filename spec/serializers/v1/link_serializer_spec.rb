require 'rails_helper'

RSpec.describe V1::StatisticSerializer, :type => :serializer do

  fixtures :links

  context 'Individual Resource Representation' do

    let(:google_link) { links(:google_link) }
    let(:serializer) { ::V1::LinkSerializer.new(google_link) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject).to match_response_serializer 'link', 'v1' }

  end

end
