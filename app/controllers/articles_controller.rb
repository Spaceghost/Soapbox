class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @users = User.all
#    @user = User.find(params[:user_id])
#    @article = @user.articles.find(params[:id])
  end
  def show
     @article = Article.find(params[:article])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user.name
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to articles_path# @article
    else
      render :action => :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to article_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to articles_url
  end
end

