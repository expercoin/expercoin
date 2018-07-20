ActiveAdmin.register Service do
  scope :all
  scope("Draft") { |scope| scope.draft  }
  scope("Pending") { |scope| scope.pending } 
  scope("Published") { |scope| scope.published }

  member_action :publish do
    resource.published!
    ServiceMailer.published(resource).deliver_later
    redirect_to action: :show
  end

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

  action_item :publish, only: :edit do
    link_to 'Publish', { action: :publish } unless resource.published?
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

      row :user do
        user = resource.owner.user
        if user
          link_to user, admin_user_path(user.id), target: :blank
        end
      end

      row :linkedin do
        user = resource.owner.user
        if user.oauth_account
          link_to user.oauth_account&.profile_url, user.oauth_account&.profile_url, target: :blank
        end
      end
    end
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
