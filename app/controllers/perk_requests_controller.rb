class PerkRequestsController < ApplicationController
  before_action :find_perk, except: [:index, :mask_perk]

  def index
    @perk_requests = policy_scope(PerkRequest)
    @perk_requests = current_user.perk_requests.select do |perk_request|
     !perk_request.hidden
    end

  end

  def mask_perk
   perk_request = PerkRequest.find(params[:perk_request_id])
   authorize perk_request
   perk_request.hidden = true
   perk_request.save
   redirect_to user_perk_requests_path
  end


  def show
    @perk_request = @perk.perk_requests.find(params[:id])
    authorize @perk_request
  end

  def new
    @perk_request = PerkRequest.new
  end

  def create
    @perk_request = PerkRequest.new
    @perk_request.perk = @perk
    @perk_request.user = current_user
    authorize @perk_request
    if @perk_request.save
      redirect_to perk_perk_request_path(@perk, @perk_request)
      # redirect_to perk_usages_path
    else
      render 'perks/show'
    end
  end

  private

  def find_perk
    @perk = Perk.find(params[:perk_id])
  end
end
