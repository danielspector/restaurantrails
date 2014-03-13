class CuisinesController < AppController
  def show
    @cuis_id = params[:id]
    if Cuisine.exists?(id: @cuis_id)
      session[:error] = false
    else
      session[:error] = true
      redirect to(pages_path)
    end
  end  
end