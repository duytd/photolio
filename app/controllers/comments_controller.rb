class CommentsController < ApplicationController

  def show
  end

  def edit
  end

  def create
    rrr = params[:content_id]
    @content = Content.find(params[:content_id])
    @comment = @content.comments.build(comment_params)
    @comment.user_id = current_user.id
    #binding.pry

    if @comment.save
      redirect_to edit_content_path(@content), notice: 'Successfully Created.[등록완료!]'
    else
      render edit_content_path(@content), notice: 'OPSS!! Error #{@content}'
      #flash_now[:alert] = "등록 실패하였습니다." => flash 는 다음 액션에서 보여주는건데 _now를 같이 사용하면 지금 페이지에서 보여줘라 이다.
    end
  end

  def update
  end

  def destory
    binding.pry
    @comment = @content.comments.find(id: params[:id])
    @comment.destory
    redirect_to edit_content_path(@content)
  end

  private
  def comment_params
    #params.permit :subject, :content
    params.require(:comment).permit :subject, :com_content
  end
end
