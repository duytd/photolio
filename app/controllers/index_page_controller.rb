class IndexPageController < ApplicationController

  def home
    #@contents = Content.all
    $notice = '환영합니다. 메인 페이지 입니다.'
  end

end

#create new edit update destroy
