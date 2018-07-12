ActiveAdmin.register Category do
  permit_params :name, :banner, :logo, :hover_logo, :parent_id

  form do |f|
    f.inputs  do
      f.input :name
      f.input :description
      f.input :banner, label: "Banner", as: :file
      f.input :logo, label: "Logo", as: :file, hint: "Icons uploaded should have transparent background. Size of the icons is limited on 120 x 80 px. They can't be larger then this but can be smaller."
      # f.input :hover_logo, label: "Hover Logo", as: :file
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
