class HomeController < ApplicationController
  def index
    @championships = Championship.all
  end
end
