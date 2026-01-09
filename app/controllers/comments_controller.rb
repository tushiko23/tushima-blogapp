class CommentsController < ApplicationController
  before_action :set_comments, only: [ :new, :create ]

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build(comment_params)

  if @comment.save
    redirect_to article_path(@article), notice: 'コメントをしました'
  else
    flash.now[:error] = 'コメントできませんでした'
    render :new, status: :unprocessable_entity
  end
  end
end

private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comments
    @article = Article.find(params[:article_id])
  end
