class Link < ActiveRecord::Base

  has_one :statistic, dependent: :destroy
  has_many :accesses, dependent: :destroy
  
  before_validation :validate_http_protocol
  before_save :generate_slug

  def validate_http_protocol
    return false if self.origin.blank?
    self.origin = "http://#{self.origin}" unless self.origin[/\Ahttp:\/\//] || self.origin[/\Ahttps:\/\//]
  end

  def validate_slug
    loop do
      if not self.slug.blank? and Link.where(slug: self.slug).count == 0
        break
      end
      generate_slug
    end
  end

  def generate_slug
    self.slug = SecureRandom.urlsafe_base64(6)
  end

end
