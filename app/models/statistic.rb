class Statistic < ActiveRecord::Base
  belongs_to :link

  def calculate_visit
    self.visit = link.accesses.count
    self.save
  end

  def calculate_unique_visit
    self.unique_visit = link.accesses.group_by(&:ip).count
    self.save
  end

end
