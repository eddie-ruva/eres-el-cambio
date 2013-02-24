class HomeController < ApplicationController
  def home
    @county = County.get_default_county;
  end
end
