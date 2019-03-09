require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "create new article" do
    visit articles_url

    click_on "Create new article"

    fill_in "Title", with: "My new article"
    fill_in "Body", with: "My new article body"

    click_on "Create Article"

    assert_selector "h1", text: "My new article"
  end

  test "update an article" do
    visit articles_url

    first_article_edit_link = page.all('a.edit-article').first
    first_article_edit_link.click

    fill_in "Title", with: "My new updated title"

    click_on "Update Article"

    assert_selector "h1", text: "My new updated title"
  end

  test "delete an article" do
    visit articles_url

    first_article_delete_link = page.all('a.delete-article').first
    first_article_delete_link.click

    assert_selector "h2.article-title", text: articles(:one).title
  end
end
