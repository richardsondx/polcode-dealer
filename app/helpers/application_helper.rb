module ApplicationHelper
  def errors(resource)
    render :partial => 'layouts/errors', :locals => {:resource => resource}
  end
end
