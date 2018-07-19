ActiveAdmin.register Service do
  scope :all
  scope("Draft") { |scope| scope.draft  }
  scope("Pending") { |scope| scope.pending } 
  scope("Published") { |scope| scope.published }

  permit_params(
    :title,
    :content,
    :cover_image,
    :category_id,
    :status,
    :featured
  )

  form do |f|
    f.inputs  do
      f.input :title
      f.input :cover_image, as: :file
      f.input :owner, as: :select, collection: User.all.map { |u| [u.email, u.id] }
      f.input :category_id, as: :select, collection: Category.children
      f.input :status
      f.input :featured
    end
    f.inputs 'Content' do
      f.input :content, input_html: { class: 'tinymce' }
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :category
    column :featured
    actions
  end 

  show do
    attributes_table do
      row :title
      row :cover_image do |service|
        image_tag service.cover_image.thumb.url
      end
      row :category
      row :owner
      row :status
      row :content do |service|
        service.content.html_safe
      end
      row :created_at
      row :featured
    end
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
