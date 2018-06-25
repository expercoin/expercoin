ActiveAdmin.register Service do
  permit_params :title, :content, :cover_image, :cover_video, :group_id

  form do |f|
    f.inputs  do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :cover_image, as: :file
      f.input :cover_video, as: :file
      f.input :group_id, as: :select, collection: Group.subcategories
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :group_id
    actions
  end 
end
