ActiveAdmin.register Profile do
  permit_params :first_name, :last_name, :photo, :title, :rate

  index do
    column :id
    column :user
    column :first_name
    column :first_name
    column :title
    column :created_at
    column 'Preview', :preview do |p|
      link_to('Preview', profile_path(p), target: "_blank" )
    end 
    actions
  end 

  show do
    attributes_table do
      row :slug
      row :first_name
      row :last_name
      row :title
      row :expercoin_rate
      row :rate
      row :professional_role
      row :years_of_experience
      row :photo
      row :about
      row 'Specialization', :specialization do |s|
        resource.specialization.values
      end
      row 'Address', :location do |l|
        l.address
      end
      row 'State', :location do |l|
        l.state
      end
      row 'Country', :location do |l|
        l.country
      end
      row 'City', :location do |l|
        l.city
      end
      row 'Zip Code', :location do |l|
        l.zip_code
      end
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
