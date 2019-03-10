class UploadArticleImageJob < ApplicationJob
  queue_as :default

  def perform(image_url, article)
    ArticlesHelper.upload_image(image_url, article)
  end
end
