ActiveAdmin.register Request do
  scope :all
  scope("Draft") { |scope| scope.draft  }
  scope("Pending") { |scope| scope.pending } 
  scope("Accepted") { |scope| scope.accepted }
  scope("Rejected") { |scope| scope.rejected } 
  scope("Completed") { |scope| scope.completed }
  scope("Upcoming") { |scope| scope.upcoming }
  scope("Expired") { |scope| scope.expired } 
  scope("Closed") { |scope| scope.closed }

  index do
    column :id
    column :message
    column :requested_length
    column :status
    column 'Requester', :requester do |r|
      full_name = "#{r.requester.first_name} #{r.requester.last_name}"
      link_to(full_name, profile_path(r.requester), target: "_blank")
    end
    column 'Expert', :expert do |r|
      full_name = "#{r.expert.first_name} #{r.expert.last_name}"
      link_to(full_name, profile_path(r.expert), target: "_blank")
    end
    actions
  end
end
