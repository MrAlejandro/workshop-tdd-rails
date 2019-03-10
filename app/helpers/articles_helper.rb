module ArticlesHelper
  def self.upload_image(image_url, article)
    image = open(image_url)
    file_name = "article_#{article.id}"
    article.image.attach(io: image, filename: file_name)
  end
end
