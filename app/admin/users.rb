ActiveAdmin.register User do
  member_action :disable_email do
    resource.update(confirmed_at: nil)
    redirect_to admin_user_path(resource)
  end

  scope :all
  scope("Pending") { |scope| scope.pending  }
  scope("Verified") { |scope| scope.verified } 


  permit_params(
    :id,
    :email,
    :password,
    :status,
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

  show do
    attributes_table do
      row :email
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :confirmed_at
      row :status
      row 'Emails enabled' do
        resource.confirmed_at ? true : false
      end
    end
  end

  action_item :disable_email, only: :edit do
    link_to 'Disable Emails', { action: :disable_email } if user.confirmed?
  end


  form do |f|
    f.inputs do
      f.input :email
      if f.object.new_record?
        f.input :password
      end
      f.input :status
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
