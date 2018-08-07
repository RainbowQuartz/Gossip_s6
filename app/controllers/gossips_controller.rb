class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossips_index_path
    end
  end

  def show

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update_attributes(gossip_params)
      flash.now[:notice] = 'Gossip updated'
      redirect_to gossips_index_path
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_index_path
  end

  private

  def gossip_params
      params.require(:gossip).permit(:title, :content)
  end
end
