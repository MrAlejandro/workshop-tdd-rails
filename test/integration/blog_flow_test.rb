require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "can create an article" do
    get new_article_path
    assert_response :success

    post articles_path,
         params: { article: { title: "New one", body: "Something interesting" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can update an article" do
    article = articles(:one)
    get edit_article_path(article)
    assert_response :success

    new_title = "New title"
    put article_path(article),
        params: { article: { title: new_title } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    updated_article = Article.find(article.id)
    assert_equal new_title, updated_article.title
  end

  test "can delete an article" do
    article = articles(:one)
    delete article_path(article)

    deleted_article = Article.find_by(id: article.id)
    assert_nil deleted_article
  end
end
