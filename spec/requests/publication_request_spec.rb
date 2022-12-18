require 'rails_helper'

RSpec.describe Publication, type: :request do
    
    before(:all) do
        @publication = create(:publication)
        @publication.save
        @user = create(:user, user_type: 'moderator')
        @user.save
        sign_in @user
    end

    #before(:each) do
    #    @publication  = Publication.find(@publication.id)
    #end

    describe 'POST /publications' do
        it 'si tiene atributos válidos' do
            expect do
                post publications_path, params: {
                    publication: {
                        title: @publication.title,
                        synopsis: @publication.synopsis
                    }
                }
            end.to change(Publication, :count).by(1)
        end

        it 'no funciona si tiene title inválido' do
            expect do
                post publications_path, params: {
                    publication: {
                        title: '',
                        synopsis: @publication.synopsis
                    }
                }
            end.to change(Publication, :count).by(0)
        end

        it 'no funciona si tiene synopsis inválido' do
            expect do
                post publications_path, params: {
                    publication: {
                        title: @publication.title,
                        synopsis: ""
                    }
                }
            end.to change(Publication, :count).by(0)
        end
    end

    describe 'PATCH /publication' do        
        it 'si nuevo title es válido' do
            expect do
                patch publication_path(@publication), params: {
                    publication: {
                        title: 'El rey Leon',
                        synopsis: @publication.synopsis
                    }
                }
                expect(Publication.find(@publication.id).title).to eq('El rey Leon')
            end
        end

        it 'no funciona si title es inválido' do
            expect do
                patch publication_path(@publication), params: {
                    publication: {
                        title: "",
                        synopsis: @publication.synopsis
                    }
                }
                expect(Publication.find(@publication.id).title).to eq(@publication.title)
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

