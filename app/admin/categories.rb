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

  index do
    column :id
    column :parent  
    column :name  
    column 'Preview', :preview do |c|
      if c.parent
        link_to('Preview', category_subcategory_path(c.parent.slug, c.slug), target: "_blank" )
      else
        link_to('Preview', category_path(c.slug), target: "_blank" )
      end
    end 
    actions
  end 

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
