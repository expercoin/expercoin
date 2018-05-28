module RatingHelper
  def display_stars(rating, text = nil)
    star = content_tag(:i, nil, class: 'fa fa-star')
    blank_star = content_tag(:i, nil, class: 'fa fa-star-o')
    half_star = content_tag(:i, nil, class: 'fa fa-star-half-o')
    return 'Not rated' if rating.nil?
    stars = Array.new(5) do |index|
      rating = (rating * 2.0).round / 2.0
      next half_star if index + 0.5 == rating
      next blank_star if index + 1 > rating
      star
    end.join
    "#{text} #{stars}".html_safe
  end

  def display_categories(profile)
    profile.categories.map(&:name).first(5).join(', ')
  end
end

