class FormtestsController < ApplicationController

    def create
	    @article = Article.find(params[:article_id])
	    @f = @article.formtests.create(form_params)
	    redirect_to article_path(@article)
    end

    private
    def form_params
      params.require(:formtest).permit(:name, :pet_dog, :pet_cat, :message, :password, :price, :disscount, :born_on, :started_at, :graduation_day, :birthday_month, :birthday_week, :address, :phone,:hompage, :favorite_color )
    end
    
end
