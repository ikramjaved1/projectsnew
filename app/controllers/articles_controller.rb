class ArticlesController < ApplicationController
  include ActionController::MimeResponds


   
    before_action :welcome_artical, only: [:new]
    after_action :blog_created, only: [:create]
    
    def index
        @article = Article.all
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
          redirect_to @article
        else
          render :new
        end
      end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
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
    params.require(:article).permit(:title, :body)
  end
end