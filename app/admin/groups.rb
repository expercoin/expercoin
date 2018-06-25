ActiveAdmin.register Group do
  permit_params :name, :banner, :logo, :hover_logo, :parent_id

  form do |f|
    f.inputs  do
      f.input :title
      f.input :subtitle
      f.input :summary
      f.input :icon_static, as: :file
      f.input :icon_active, as: :file
      f.input :parent_id, as: :select, collection: Group.main
    end
    f.actions
  end

  index do
    column :id
    column :parent
    column :title
    actions
  end 

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
