class ArticlesController < ApplicationController
  


  def index
    # @articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)

    @q2 = Article.ransack(params[:q])


  end  

  def search
    
  end

  def show

    @article = Article.find(params[:id])

  end

  def new
    @article = Article.new

  end

  def create
    @timer = Time.current
      @article = Article.new(article_params)
      @article.user = current_user
      
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end


