require 'rails_helper'

RSpec.describe Review, type: :request do
    
    before(:all) do
        @review = FactoryBot.create(:review)
        @review.save
        @user = User.find(@review.user_id)
        sign_in @user
    end

    describe 'crear review' do
        it 'si tiene atributos válidos' do
            expect do
                post publication_reviews_path(@review.publication_id), params: {
                    review: {
                        rating: @review.rating,
                        content: @review.content
                    }
                }
            end.to change(Review, :count).by(1)
        end

        it 'no funciona si tiene rating inválido' do
            expect do
                post publication_review_path, params: {
                    review: {
                        rating: -1,
                        content: @review.content
                    }
                }
            end.to change(Review, :count).by(0)
        end
    end

    describe 'actualizar review' do        
        it 'si nuevo rating es válido' do
            expect do 
                patch publication_review_path(@review), params: {
                    review: {
                        rating: 5,
                        content: @review.content
                    }
                }
                expect(Review.find(@review.id).rating).to eq(5)
            end
        end

        it 'no funciona si content es inválido' do
            expect do
                patch publication_review_path(@review), params: {
                    review: {
                        rating: @review.rating,
                        content: ""
                    }
                }
                expect(Review.find(@review.id).content).to eq(@review.content)
            end
        end
    end

    describe "eliminar review" do
        it "borrar si review existe" do
            expect do
                delete publication_review_path(id: @review.id, publication_id: @review.publication_id)
            end.to change(Review, :count).by(-1)
        end
    end
end