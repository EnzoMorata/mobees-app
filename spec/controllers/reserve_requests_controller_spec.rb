require 'rails_helper'

RSpec.describe ReserveRequestsController, type: :controller do

    before(:all) do
        @reserve_request = create(:reserve_request)
        @reserve_request.save
        @user = User.find(@reserve_request.user_id)
        @reserve_request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in @user
    end

    describe 'GET #new' do
        it 'si un cliente ingresa a crear nueva reserva' do
            get :new, params: {publication_id: @reserve_request.publication_id}
            expect(response).to redirect_to(publication_path(@reserve_request.publication_id))
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