class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_comment, only: [:show]

  def show; end

  def create
    @comment = Comment.new(comments_params)

    if @comment.save
      render :show
    else
      render_error
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comments).permit(:name, :comment)
  end

  def render_error
    render json: { errors: @story.error.full_messages }
  end
end
