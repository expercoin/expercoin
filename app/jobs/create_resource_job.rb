class CreateResourceJob < ApplicationJob
  queue_as :default

  def perform(resource, params)
    resource.constantize.new(params).perform
  end
end
