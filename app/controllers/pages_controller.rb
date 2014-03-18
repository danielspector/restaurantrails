class PagesController < ApplicationController
  def index
    session[:error] ? @error = true : @error = false
    session[:error] = false
    render :index
  end

  def search
    # if params[:zip].empty? && !params[:cuisine].empty?
    #   if Cuisine.find(description: params[:cuisine])
    #     c = Cuisine.find(description: params[:cuisine])
    #     redirect_to(cuisine_path(c))
    #   else 
    #     c = Cuisine.all.collect do |c|
    #       c.description.split("-")
    #     end
    #     match = c.detect { |d| d.include?(params[:cuisine]) }
    #     redirect_to(cuisine_path(match)) if match
    #   end
    # # elsif !params[:zip].empty? &&  params[:cuisine].empty?
    # #   match = Restaurant.all_zips.detect { |zip| zip == params[:zip]}
    # #   redirect_to(zip_path(match)) if match

    # # CUISINE/ZIP PAGE
    # # elsif !params[:zip].empty? && !params[:cuisine].empty?
    # #   c = Cuisine.all.collect do |c|
    # #     c.description.split("-")
    # #   end
    # #   match_cuis = c.detect { |d| d.include?(params[:cuisine]) }
    # #   match_cuis
    # elsif !params[:restaurant].empty?
    #   r = Restaurant.all.collect do |c|
    #     r.name.split("-")
    #   end
    #   match = r.detect { |n| n.include?(params[:restaurant]) }
    #   redirect_to(restaurant_path(match)) if match
    #   end   
    # else
    #   redirect_to(home_path)  
    # end
  end



end