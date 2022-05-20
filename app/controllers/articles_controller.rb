class ArticlesController < ApplicationController
  include ActionController::MimeResponds
    before_action :welcome_artical, only: [:new]
    after_action :blog_created, only: [:create]
    
    def index
        @newspaper = NewsPaper.find(params[:news_paper_id])
        @articles = @newspaper.articles
      end
    
      def show
        @newspaper = NewsPaper.find(params[:news_paper_id])
        @article = @newspaper.articles.find(params[:id])
      end
    
      def new
        @newspaper = NewsPaper.find(params[:news_paper_id])
        @article = @newspaper.articles.new
      end
    
      def create
        @newspaper = NewsPaper.find(params[:news_paper_id])
        @article = @newspaper.articles.create(article_params)
        if @article.save!
          redirect_to news_paper_articles_path
        else
          render :new
        end
      end

  def edit
    @newspaper = NewsPaper.find(params[:news_paper_id])
    @article = @newspaper.articles.find(params[:id])
  end

  def update
    @newspaper = NewsPaper.find(params[:news_paper_id])
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to news_paper_article_path(@newspaper, @article)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end  

  private

  def welcome_artical
    puts "Welcome to new blog"  
  end  


  def blog_created
    puts "Blog is created"  
    flash[:alert] = "Blog is created"

  end  

  private
  def article_params
    params.require(:article).permit(:title, :body ,:news_paper_id)
  end
  
end