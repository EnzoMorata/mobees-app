# frozen_string_literal: true

# Defines the class for the Publications controller
class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @publications = Publication.all
    return unless user_signed_in?

    @is_moderator = User.exists?(user_type: 'moderator', id: current_user.id)
    @is_client = User.exists?(user_type: 'client', id: current_user.id)
  end

  def show
    @publication = Publication.find(params[:id])
    @is_moderator = User.exists?(user_type: 'moderator', id: current_user.id)
    @is_client = User.exists?(user_type: 'client', id: current_user.id)
  end

  def new
    @is_client = User.exists?(user_type: 'client', id: current_user.id)
    redirect_to publications_path if @is_client
  end

  def create
    @publication = Publication.create(publication_params)
    if @publication.save
      redirect_to publications_path
    else
      render :new
    end
  end

  def edit
    @is_client = User.exists?(user_type: 'client', id: current_user.id)
    redirect_to publications_path if @is_client
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    @publication.update(publication_params)
    @publication.save
    redirect_to publication_path(params[:id])
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to publications_path
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :synopsis, :thumbnail)
  end
end
