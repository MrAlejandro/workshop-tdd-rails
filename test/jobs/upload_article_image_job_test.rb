require 'test_helper'

class UploadArticleImageJobTest < ActiveJob::TestCase
  # test "article image uploading" do
  #   article = articles(:one)
  #   UploadArticleImageJob.perform_now(test_image_path, article)
  #
  #   article.reload
  #   assert article.image.attached?
  # end

  def after_teardown
    super
    remove_uploaded_files
  end

  private

  def test_image_path
    "#{__dir__}/../fixtures/files/test_image.jpeg"
  end

  def remove_uploaded_files
    FileUtils.rm_rf(Rails.root.join('tmp', 'storage'))
  end
end
