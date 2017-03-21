module ApplicationHelper

  def filter_link resource, value
    link_to value, url_for(request.query_parameters.merge(resource => value))
  end

end
