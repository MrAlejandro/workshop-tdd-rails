require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  test 'can create an article' do
    title = 'New title'
    body = 'New body'

    post articles_path,
         params: { article: { title: title, body: body }, image_url: test_image_path }

    new_article = Article.find_by(title: title)
    new_article.image.attached?
    assert { body == new_article.body }
    assert { new_article.image.attached? }
  end

  test 'can update an article' do
    article = articles(:one)
    new_title = 'Updated title'
    put article_path(article),
        params: { article: { title: new_title } }

    article.reload
    assert { new_title == article.title }
  end

  test 'can delete an article' do
    article = articles(:one)
    delete article_path(article)

    deleted_article = Article.find_by(id: article.id)
    assert { nil == deleted_article }
  end

  private

  def test_image_path
    "#{__dir__}/../fixtures/files/test_image.jpeg"
  end
end
