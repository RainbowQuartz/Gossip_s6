class GossipsController < ApplicationController
  #before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
         puts "j'affiche le create"
         @gossip = Gossip.create(gossip_params)
         @gossip.user_id = current_user.id
         if @gossip.save
             redirect_to gossips_index_path
         else
             render 'new'
         end
     end

  def show
    @gossip = Gossip.find(params[:id])

  end

  def edit
    @gossip = Gossip.find(params[:id])
      puts 'je suis edit -------------'
  end

  def update
    @gossip = Gossip.find(params[:id])
      redirect_to gossips_index_path
      puts 'je suis update -------------'
  end

  def destroy
<<<<<<< HEAD
    if current_user.id == Gossip.find(:id).user_id
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_index_path
    else
      redirect_to gossips_index_path
      flash[:alert] = "You cannot delete gossips that aren't your own"
    end
=======
    @gossip = Gossip.find(params[:id])
    unless @gossip.user_id == current_user.id
      flash[:alert] = "You are not the creator of this gssip, therefore you're not permitted to edit or destroy this gossip"
      redirect_to root_path # or anything you prefer
      return false # Important to let rails know that the controller should not be executed
    end
    @gossip.destroy
    redirect_to gossips_index_path
>>>>>>> roro
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
