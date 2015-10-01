require 'rails_helper'

RSpec.describe LinksHelper, type: :helper do
  
  fixtures :links 

  let(:google_link) { links(:google_link) }

  describe ".short_link" do
    it { expect(short_link(google_link)).to include(google_link.slug ,"</a>") }
  end

end
