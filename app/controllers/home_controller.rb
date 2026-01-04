class HomeController < ApplicationController
  def index
  @article = Article.first
  end

  def about
    @about = 'aboutページの表示が確認できました'
    render 'home/about'
  end
end
