ActiveAdmin.register Category do
  permit_params :name, :photo, :parent_id

  form do |f|
    f.inputs  do
      f.input :name
      f.input :description
      f.input :banner, label: "Banner", as: :file
      f.input :parent_id, as: :select, collection: Category.main
    end
    f.actions
  end
end
