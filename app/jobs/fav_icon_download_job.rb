class FavIconDownloadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @login.urls.each { |u| u.download_favicon(u.uri) }
    @login.save
  end
end
