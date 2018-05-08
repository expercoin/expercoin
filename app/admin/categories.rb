ActiveAdmin.register Category do
  permit_params :name, :banner, :parent_id

  form do |f|
    f.inputs  do
      f.input :name
      f.input :description
      f.input :banner, label: "Banner", as: :file
      f.input :parent_id, as: :select, collection: Category.main
    end
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
