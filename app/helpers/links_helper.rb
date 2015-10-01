module LinksHelper
  def short_link link
    url = "#{Rails.application.secrets.base_url}" + link.slug
    link_to url, url
  end
end
