ActiveAdmin.register MailRecord do
  index do
    column :id
    column :recipient
    column :sent
    column :mail_type
    column :subject
    actions
  end
end