require 'rails_helper'

RSpec.describe Access, type: :model do

  fixtures :links
  fixtures :statistics
  fixtures :accesses

  let(:google_link)       { links(:google_link) }
  let(:google_statistic)  { statistics(:google_statistic) }
  let(:google_access)     { accesses(:google_access) }
  
  it { should belong_to(:link) }

  describe ".calculate_number_of_visit" do
    before do
      google_access_again = Access.create(ip: '192.168.9.9', link: google_link)
    end

    it { expect(google_statistic.visit).to eq(2) }
    it { expect(google_statistic.unique_visit).to eq(2) }
  end

end
