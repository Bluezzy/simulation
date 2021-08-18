class ChampionshipsController < ApplicationController
  def index
    @championships = Championship.all
  end

  def show
    @championship = Championship.find(params[:id])
  end
end
