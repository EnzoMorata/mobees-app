# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Información Oficial' do
          para 'Bienvenid@ Admin, puedes navegar en las distintas pestañas para poder manejar los distintos recursos disponibles de la aplicación.'
        end
      end
    end

    columns do
      column do
        panel 'Publicaciones recientes' do
          ul do
            Publication.last(5).map do |publication|
              li link_to(publication.title, admin_publication_path(publication.id))
            end
          end
        end
      end

      column do
        panel 'Usuarios nuevos' do
          ul do
            User.last(5).map do |user|
              li link_to(user.name, admin_user_path(user.id))
            end
          end
        end
      end
    end

    columns do
      column do
        panel 'Nuevas Reviews' do
          ul do
            Review.last(5).map do |review|
              li link_to(
                "#{User.find(review.user_id).name} ha hecho una review en #{Publication.find(review.publication_id).title}", admin_review_path(review.id)
              )
            end
          end
        end
      end
    end
  end
end
