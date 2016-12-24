require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:new_link) { Link.new }

  it { should have_one(:statistic) }
  it { should have_many(:accesses) }

  describe '.validate_http_protocol' do
    it "always have http protocol in origin" do
      new_link.origin = 'google.com'
      new_link.save
      expect(new_link.origin).to include('http')
    end

    it "won't persist if origin is blank" do
      new_link.save
      expect(new_link.persisted?).to eq false
    end
  end

  describe '.validate_slug' do
    before do
      new_link.validate_slug
    end

    it { expect(Link.where(slug: new_link.slug).count).to eq 0 }
  end

  describe '.generate_slug' do
    before do
      new_link.generate_slug
    end

    it { expect(new_link.slug.class).to eq String }
    it { expect(new_link.slug.length).to eq 8 }
  end
end
