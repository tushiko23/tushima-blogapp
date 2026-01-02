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
      redirect_to article_path(@article), notice: "記事が正常に作成されました。"
    else
      flash.now[:error] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "記事が正常に編集されました"
    else
      flash.now[:error] = "編集に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    redirect_to root_path, status: :see_other, notice: "削除に成功しました"
  end
end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end
