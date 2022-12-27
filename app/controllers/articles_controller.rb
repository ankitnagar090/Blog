
class ArticlesController < ApplicationController
  

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


   http_basic_authenticate_with name: "akkii", password: "123", except: [:index, :show]
   def preview
    
  end
   
  def index
    @a1 = Article.all
   #render json: @a1, formats: :xml
    session[:title]="ankit"
  end

  def show
    @a1 = Article.find(params[:id])
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@article) }
    end
  end

  def new
    @a1 = Article.new
  end


  def create
    @a1 = Article.new(article_params)
    
    if @a1.save
    
      if params[:article][:comment][:commenter].present?
         @c =  @a1.comments.new(commenter: params[:article][:comment][:commenter], body: params[:article][:comment][:body])
         @c.save
      end
     
        redirect_to @a1
    else
      render :new, status: :unprocessable_entity

    end
  end

  def edit
    @a1 = Article.find(params[:id])
  end

  def update
    @a1 = Article.find(params[:id])

    if @a1.update(article_params)
      redirect_to @a1, notice: "You have successfully logged out."
    else
      render :edit, status: :unprocessable_entity

    end
  end

  def destroy
    @a1 = Article.find(params[:id])
    @a1.destroy

    redirect_to root_path, status: :see_other
  end

  def download_pdf
    article = Article.find(params[:id])
    send_data generate_pdf(article),
              filename: "#{article.name}.pdf",
              type: "application/pdf"
  end

  private
    def article_params
      params.require(:article).permit(:title, :body,:title_confirmation,:account_no,:cover_photo, comment_attributes: [:commenter, :body, :_destroy]) 
    end
    def comment_params
      params.require(:comment).permit(:commenter, :body, :article_id)
    end

    def generate_pdf(article)
      Prawn::Document.new do
        text article.title, align: :center
         text "Address: #{client.address}"
        text "Email: #{client.email}"
      end.render
    end

    def record_not_found
      flash[:error] = "You don't have access to this section."
      render plain: "record are not available", status: 404
    end


    
end
