class Access < ActiveRecord::Base
  belongs_to :link

  after_create :calculate_number_of_visit

  def calculate_number_of_visit
    link.statistic.calculate_visit
    link.statistic.calculate_unique_visit
  end

  
end
