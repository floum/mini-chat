class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comments = Comment.paginate(page: params[:page]).order('created_at DESC')

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          flash[:success] = 'Your comment was successfully posted!'
        else
          flash[:error] = 'Your comment could not be saved.'
        end
        format.html { redirect_to root_url }
        format.js
      else
        format.html { redirect_to root_url }
        format.js { render nothing: true }
      end
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end
