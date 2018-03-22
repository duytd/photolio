module SearchHelper

  def content_search type,text
    Content.where("#{type} LIKE ?", "%#{text}%").paginate(page: params[:page], per_page: 7)
  end

end
