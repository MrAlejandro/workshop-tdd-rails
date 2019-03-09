class NewArticlePage
  def create(*attributes)
    find('[data-test="article-title"]').set title
    find('[data-test="article-body"]').set body

    find('[data-test="create-article"]').click
  end
end
