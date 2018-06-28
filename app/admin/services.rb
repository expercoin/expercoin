ActiveAdmin.register Service do
  permit_params(
    :title,
    :content,
    :cover_image,
    :category_id,
    service_providers_attributes: %i[id profile_id featured]
  )

  form do |f|
    f.inputs  do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :cover_image, as: :file
      f.input :category_id, as: :select, collection: Category.children
      f.has_many :service_providers do |service_provider_f|
        service_provider_f.input :profile, as: :select, collection: Profile.all.map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
        service_provider_f.input :featured
      end
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :group_id
    actions
  end 

  show do
    default_main_content
    panel "Profiles" do
      table_for service.profiles do
        column :id
        column 'Featured' do |profile|
          profile == service.service_providers.find_by(featured: true).try(:profile)
        end
        column :first_name
        column :last_name
        column 'email' do |profile|
          profile.user.email
        end
        column 'Actions' do |profile|
          link_to 'View', admin_profile_path(profile)
        end
      end

    end
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
