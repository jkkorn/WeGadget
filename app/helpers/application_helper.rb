module ApplicationHelper

  def list_categories
    @categories = Category.all
  end

end
