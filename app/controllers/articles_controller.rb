class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to root_path, notice: "記事が正常に作成されました。"
    else
      flash.now[:error] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end
end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end
