ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params(
    :id,
    :email,
    :password,
    profile_attributes: %i[id first_name last_name title rate photo]
  )
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :email
    column :created_at
    actions
  end


  form do |f|
    f.inputs do
      f.input :email
      f.input :password
    end
    f.has_many :profile do |s|
      s.input :first_name
      s.input :last_name
      s.input :title
      s.input :rate
      s.input :photo, as: :file
    end

    actions
  end
end
