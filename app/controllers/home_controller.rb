class HomeController < ApplicationController
  def index
  @index = "デイトラ"
  end

  def about
    @about = "aboutページの表示が確認できました"
    render "home/about"
  end
end
