class Link < ActiveRecord::Base
  has_one :statistic, dependent: :destroy
  has_many :accesses, dependent: :destroy

  before_validation :validate_http_protocol
  before_save :generate_slug

  def validate_http_protocol
    throw :abort if self.origin.blank?

    unless self.origin[/\Ahttp:\/\//] || self.origin[/\Ahttps:\/\//]
      self.origin = "http://#{self.origin}"
    end
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
