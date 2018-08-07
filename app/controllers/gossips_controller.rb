class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end
end
