require 'rails_helper'

RSpec.describe V1::AccessSerializer, :type => :serializer do

  fixtures :accesses

  context 'Individual Resource Representation' do

    let(:google_access) { accesses(:google_access) }
    let(:serializer) { ::V1::AccessSerializer.new(google_access) }
    let(:serialization) { ActiveModel::Serializer::Adapter.create(serializer) }

    subject do
      JSON.parse(serialization.to_json)
    end

    it { expect(subject).to match_response_serializer 'access', 'v1' }

  end

end
