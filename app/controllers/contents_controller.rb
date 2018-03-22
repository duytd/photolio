class ContentsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @contents = Content.all.paginate(page: params[:page], per_page: 7)
    # User.find_by(name: params[:name].downcase)
    # where 문을 사용하면 배열로 받아온다.
    # find_by 는 찾는게 없더라고 nil 값으로 리턴된다. find로 하면 없을때 오류가 발생한다.

    @notice = '파일 리스트 페이지 입니다.'
  end

  def new
  end

  def edit
    @contents2 = Content.where(id: params[:id])
    @contents = Content.find_by(id: params[:id])
    @notice = '수정 페이지 입니다.'
    #render :show
  end

  def create
    #binding.pry
    @content = Content.create(title: params[:title], description: params[:description], image: params[:image])

    respond_to do |format|
      if !!@content
        format.html { redirect_to :contents_show, notice: 'Successfully Created.' }
        #format.json { render :show, status :created, location: @content }
      else
        format.html { render :show, notice: 'OPSS!! Error #{@content}' }
        #format.json { render :json, @content.errors, status :unprocessable_entity }
        #flash_now[:alert] = "등록 실패하였습니다." => flash 는 다음 액션에서 보여주는건데 _now를 같이 사용하면 지금 페이지에서 보여줘라 이다.
      end
    end
    #redirect_to :contents_show
  end

  def update
    #binding.pry
    @Content = Content.find(params[:id])
    if @Content.update_attributes(:title => params[:content][:title], :description => params[:content][:description] )
      flash[:success] = "Successfully Updated"
      redirect_to edit_content_path(params[:id])
      #redirect_to contents_show_path
    else
      render 'edit'
    end

  end

  def destroy
    redirect_to :contents_show
  end

  def search
    serach_type = params[:serach_type]
    search_text = params[:search_text]
    @contents = content_search serach_type,search_text
    render :show
  end

#  private

#  def content_params
#    params.require(:content).permit(:title, :description, :image)
#  end

end
