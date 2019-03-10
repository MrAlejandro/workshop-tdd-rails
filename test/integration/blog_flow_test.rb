require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  test 'can create an article' do
    title = 'Title'
    body = 'Body'
    post articles_path,
         params: { article: { title: title, body: body } }

    new_article = Article.find_by(title: title)
    assert_equal body, new_article.body
  end

  test 'can update an article' do
    article = articles(:one)
    new_title = 'New title'
    put article_path(article),
        params: { article: { title: new_title } }

    article.reload
    assert_equal new_title, article.title
  end

  test 'can delete an article' do
    article = articles(:one)
    delete article_path(article)

    deleted_article = Article.find_by(id: article.id)
    assert_nil deleted_article
  end
end
