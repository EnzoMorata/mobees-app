require 'rails_helper'

RSpec.describe ReserveRequest, type: :request do
    
    before(:all) do
        @reserve_request = create(:reserve_request)
        @reserve_request.save
        @user = User.find(@reserve_request.user_id)
        @user.save
        sign_in @user
    end

    describe 'POST /reserve_request' do
        it 'si tiene atributos válidos' do
            expect do
                post publication_reserve_requests_path(@reserve_request.publication_id), params: {
                    reserve_request: {
                        approval_state: @reserve_request.approval_state,
                        start_date: @reserve_request.start_date,
                        finish_date: @reserve_request.finish_date,
                        publication_id: @reserve_request.publication_id,
                        user_id: @reserve_request.user_id
                    }
                }
            end.to change(ReserveRequest, :count).by(1)
        end

        it 'no funciona si tiene start date inválido' do
            expect do
                post publication_reserve_requests_path(@reserve_request.publication_id), params: {
                    reserve_request: {
                        approval_state: @reserve_request.approval_state,
                        start_date: "",
                        finish_date: @reserve_request.finish_date,
                        publication_id: @reserve_request.publication_id,
                        user_id: @reserve_request.user_id
                    }
                }
            end.to change(ReserveRequest, :count).by(0)
        end

        it 'no funciona si tiene finish date inválido' do
            expect do
                post publication_reserve_requests_path(@reserve_request.publication_id), params: {
                    reserve_request: {
                        approval_state: @reserve_request.approval_state,
                        start_date: @reserve_request.start_date,
                        finish_date: "",
                        publication_id: @reserve_request.publication_id,
                        user_id: @reserve_request.user_id
                    }
                }
            end.to change(ReserveRequest, :count).by(0)
        end
    end

    describe 'PATCH /reserve_request' do        
        it 'si start date es válido' do
            expect do
                p @reserve_request
                patch publication_reserve_request_path([id: @reserve_request.id, publication_id: @reserve_request.publication_id]), params: {
                    reserve_request: {
                        approval_state: @reserve_request.approval_state,
                        start_date: @reserve_request.finish_date - 1,
                        finish_date: @reserve_request.finish_date,
                        publication_id: @reserve_request.publication_id,
                        user_id: @reserve_request.user_id
                    }
                }
                p @reserve_request
                expect(ReserveRequest.find(@reserve_request.id).start_date).to eq(@reserve_request.finish_date - 1)
            end
        end

        
    end

    #describe "DELETE /publication" do
    #    it "borrar si publication existe" do
    #        p Publication.all.length
    #        p @publication
    #        expect do
    #            delete publication_path(@publication.id), params: {
    #                id: @publication.id
    #            }
    #            p Publication.all.length
    #            p Publication.find(@publication.id)
    #            #expect.to have_http_status(204)    
    #                   
    #        end.to change(Publication, :count).by(-1)
    #    end
    #end
end

