require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do

    before(:all) do
        @publication = create(:publication)
        @publication.save
    end

    describe 'GET #index' do 
        it 'si es un usuario no logueado' do
            get :index
            expect(response).to have_http_status(:success)
        end

        it 'si es un cliente' do 
            @user = create(:user)
            @user.save
            sign_in @user
            get :index
            expect(response).to have_http_status(:success)
        end

    end

    describe 'GET #show' do
        it 'si usuario está logueado' do
            @user = create(:user)
            @user.save
            sign_in @user
            get :show, params: {id: @publication.id}
            expect(response).to have_http_status(:success)
        end 

        it 'si usuario no está logueado' do
            get :show, params: {id: @publication.id}
            expect(response).to redirect_to(new_user_session_path)
        end 
    end

    describe 'GET #new' do
        it 'si un cliente ingresa a crear nueva publicacion' do
            @user = create(:user)
            @user.save
            sign_in @user
            get :new
            expect(response).to redirect_to(publications_path)
        end 
    end

    describe 'GET #edit' do
        it 'si un moderador ingresa a editar publicacion' do
            @user = create(:user, user_type: 'moderator')
            @user.save
            sign_in @user
            get :edit, params: {id: @publication.id}
            expect(response).to have_http_status(:success)
        end
    end

    describe 'PATCH #update' do
        it 'si un moderador ingresa una solicitud de editar una publicacion' do
            @user = create(:user, user_type: 'moderator')
            @user.save
            sign_in @user
            patch :update, params: {id: @publication.id, publication: {title: "nuevo título", synopsis: "nueva sinopsis"}}
            expect(response).to redirect_to(publication_path(@publication.id))
        end
    end

    describe 'DELETE #destroy' do
        it 'si un moderador ingresa una solicitud de eliminar una publicacion' do
            @user = create(:user, user_type: 'moderator')
            @user.save
            sign_in @user
            delete :destroy, params: {id: @publication.id}
            expect(response).to redirect_to(publications_path)
        end
    end
end