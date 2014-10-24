class SearchesController < ApplicationController 

  def show
    @query = params[:search][:query]
    @results = Shout.search(@query)
  end

end 