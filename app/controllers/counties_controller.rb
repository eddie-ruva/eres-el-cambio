class CountiesController < ApplicationController
  def search_on_name
    render :json => County.search_for_term_name(params['term'])
  end

  def show_by_term
    @county = County.find_by_closest_name(params[:county_searched])
    if @county
      render :json => @county
    else
      render :json => {:error => "county not-found"}.to_json, status: 404
    end
  end
end
