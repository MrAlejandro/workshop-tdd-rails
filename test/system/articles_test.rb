require 'application_system_test_case'

class ArticlesTest < ApplicationSystemTestCase
  test 'create an article' do
    title = 'Title'
    body = 'Body'
    create_article(title: title, body: body)

    new_article = Article.find_by(title: title)
    assert_equal(body, new_article.body)
  end

  test 'update an article' do
    article = articles(:one)
    body = 'New body'
    update_article(article, body: 'New body')

    article.reload
    assert_equal(body, article.body)
  end

  test 'delete an article' do
    article = articles(:one)
    delete_article(article)

    assert_equal(nil, Article.find_by(id: article.id))
  end

  def create_article(**attributes)
    visit articles_url
    find('[data-test="create-new-article"]').click

    update_article_attributes(attributes)
    find('[data-test="create-article"]').click
  end

  def update_article(article, **attributes)
    visit articles_url
    find("[data-test=\"edit-article-#{article.id}\"]").click

    update_article_attributes(attributes)
    find('[data-test="update-article"]').click
  end

  def update_article_attributes(attributes)
    attributes.each do |name, value|
      find("[data-test=\"article-#{name}\"]").set value
    end
  end

  def delete_article(article)
    visit articles_url
    find("[data-test=\"delete-article-#{article.id}\"]").click
  end
end
