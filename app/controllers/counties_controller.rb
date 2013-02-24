class CountiesController < ApplicationController
  def search_on_name
    render :json => County.search_for_term_name(params['term'])
  end
end
