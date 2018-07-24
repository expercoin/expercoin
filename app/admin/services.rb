# frozen_string_literal: true

ActiveAdmin.register Service do
  scope :all
  scope('Draft', &:draft)
  scope('Pending', &:pending)
  scope('Published', &:published)

  member_action :publish do
    resource.published!
    ServiceMailer.published(resource).deliver_later
    redirect_to action: :show
  end

  permit_params(
    :owner_id,
    :title,
    :content,
    :cover_image,
    :category_id,
    :status,
    :featured,
    page_attributes: %i[id title keywords description name url]
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
    f.inputs 'Meta Tags' do
      f.has_many :page do |f_page|
        f_page.input :title
        f_page.input :keywords
        f_page.input :description
        f_page.input :name
        f_page.input :url, input_html: { value: service_url(resource) }
      end
    end
    f.actions
  end

  action_item :publish, only: :edit do
    link_to 'Publish', action: :publish unless resource.published?
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
        link_to user, admin_user_path(user.id), target: :blank if user
      end

      row :linkedin do
        user = resource.owner.user
        link_to user.oauth_account&.profile_url, user.oauth_account&.profile_url, target: :blank if user.oauth_account
      end
    end
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
