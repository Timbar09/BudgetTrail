module CategoriesHelper
  def icon_fallback(icon)
    if icon.attached?
      icon
    else
      'https://via.placeholder.com/150'
    end
  end
end
