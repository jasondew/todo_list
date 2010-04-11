module ApplicationHelper

  def flashes
    %w(notice warning error).map do |type|
      content = flash[type.to_sym]
      content_tag(:div, content, :id => type) unless content.blank?
    end.compact.join
  end

end
