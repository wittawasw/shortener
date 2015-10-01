require 'rails_helper'

RSpec.describe "links/show.html.erb", type: :view do

  fixtures :links
  fixtures :statistics
  fixtures :accesses

  let(:google_link) { links(:google_link) }
  let(:google_statistic) { statistics(:google_statistic) }
  let(:google_access) { accesses(:google_access) }

  before do
    assign(:link, google_link)
    render
  end

  it { expect(rendered).to include(google_link.origin)}
  it { expect(rendered).to include(google_statistic.visit.to_s)}
  it { expect(rendered).to include(google_statistic.unique_visit.to_s)}
  it { expect(rendered).to include(google_access.ip)}


end
