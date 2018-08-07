class GossipsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

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

  def logged_in_user
    unless user_signed_in?
      redirect_to new_user_session_path
      flash[:alert] = 'Please sign in or sign up'
    end
  end
end
