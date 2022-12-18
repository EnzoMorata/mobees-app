# frozen_string_literal: true

# Defines the class for the ReserveRequests controller
class ReserveRequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @publication = Publication.find(params[:publication_id])
  end

  def create
    @publication = Publication.find(params[:publication_id])
    @reserve_request = ReserveRequest.create(reserve_request_params)
    @reserve_request.publication_id = @publication.id
    @reserve_request.user_id = current_user.id
    if @reserve_request.save
      redirect_to publication_path(@publication)
    else
      render :new
    end
  end

  def edit
    @is_approved = ReserveRequest.exists?(approval_state: true, id: params[:id])
    if @is_approved
      redirect_to publication_path(params[:publication_id])
    else
      @reserve_request = ReserveRequest.find(params[:id])
      @publication = Publication.find(params[:publication_id])
    end
  end

  def update
    @reserve_request = ReserveRequest.find(params[:id])
    @reserve_request.update(reserve_request_params)
    if @reserve_request.save
      redirect_to publication_path(params[:publication_id])
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @reserve_request = ReserveRequest.find(params[:id])
    @reserve_request.destroy
    redirect_to publication_path(@publication)
  end

  def approve
    @publication = Publication.find(params[:publication_id])
    @reserve_request = ReserveRequest.find(params[:id])
    @reserve_request.approval_state = true
    @reserve_request.save
    redirect_to publication_path(@publication)
  end

  def disapprove
    @publication = Publication.find(params[:publication_id])
    @reserve_request = ReserveRequest.find(params[:id])
    @reserve_request.approval_state = false
    @reserve_request.save
    redirect_to publication_path(@publication)
  end

  private

  def reserve_request_params
    params.require(:reserve_request).permit(:start_date, :finish_date, :approval_state)
  end
end
