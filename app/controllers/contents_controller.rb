class ContentsController < ApplicationController
  def show
    @contents = Content.all
    $notice = '파일 리스트 페이지 입니다.'
  end

  def edit
  end

  def create
    Content.create(title: params[:title], image: params[:image])
    redirect_to :contents_show
  end

  def update
    # TO DO
  end

  def destroy
  end
end
