# frozen_string_literal: true

# Defines the class for the Reviews controller
class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @publication = Publication.find(params[:publication_id])
    @already_publish = Review.exists?(publication_id: params[:publication_id], user_id: current_user.id)
  end

  def create
    @publication = Publication.find(params[:publication_id])
    @review = Review.create(review_params)
    @review.publication = @publication
    @review.user_id = current_user.id
    if @review.save
      redirect_to publication_path(@publication)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @publication = Publication.find(params[:publication_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to publication_path(params[:publication_id])
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:publication_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to publication_path(@publication)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
