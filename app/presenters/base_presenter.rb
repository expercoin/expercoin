class BasePresenter
  def initialize(model, view)
    @view = view
    @model = model
  end

  def h
    @view
  end
end

# class TestPresenter < BasePresenter
#   def full_name
#    "#{@model.first_name} #{@model.last_name}"
#   end
#   
#   def avatar
#     @model.link
#   end
# end

# module ApplicationHelper
#   module ApplicationHelper
#     def present(model, presenter_class=nil)
#       klass = presenter_class || "#{model.class}Presenter".constantize
#       presenter = klass.new(model, self)
#       yield(presenter) if block_given?
#     end
#   end  
# end

# If you don`t pass class name it will use instance class name with Presenter

# <%= presenter(@user, TestPresenter) %> 

# You can pass a block

# <% presenter(@user) do |user| %>
#   <h3><%= user.avatar %></h3>
#   <h1><%= user.full_name %></h1>
# <% end %>