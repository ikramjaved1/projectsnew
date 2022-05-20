class NewsPapersController < ApplicationController
  def index
    @newspapers=NewsPaper.all
  end
  def show
    @newspapers = NewsPaper.find(params[:id])
  end
  def new
    @newspapers = NewsPaper.new
  end

  def create
    @newspapers = NewsPaper.new(news_paper_params)
    if @newspapers.save
      redirect_to news_papers_path
    else
      render :new
    end
  end
  def destroy
    @newspaper = NewsPaper.find(params[:id])
    @newspaper.destroy
    redirect_to news_papers_path
  end

  private
    def news_paper_params
      params.require(:news_paper).permit(:name)
    end
end
