ActiveAdmin.register Review do
  index do
    column :id
    column :message
    column :rate
    column :created_at
    column 'Author', :author do |r|
      full_name = "#{r.author.first_name} #{r.author.last_name}"
      link_to(full_name, profile_path(r.author), target: "_blank")
    end
    column 'Expert', :profile do |r|
      full_name = "#{r.profile.first_name} #{r.profile.last_name}"
      link_to(full_name, profile_path(r.profile), target: "_blank")
    end
    actions
  end
end
