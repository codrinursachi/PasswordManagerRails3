require "open-uri"

class Url < ApplicationRecord
  belongs_to :login
  has_one_attached :fav_icon

  def download_favicon(url)
    domain = URI.parse(url).host

    if domain
      favicon_url = "https://#{domain}/favicon.ico"
      file = URI.open(favicon_url)
      content_type = file.meta["content-type"]
      fav_icon.attach(io: file, filename: "favicon.ico", content_type:)
    end
  end
end
