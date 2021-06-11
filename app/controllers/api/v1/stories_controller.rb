class Api::V1::StoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  before_action :set_story, only: [:show, :update, :destroy]
  def index
    @stories = Story.all
    # p params[:keyword]
    @stories = Story.where("name LIKE ?", params[:keyword]) if params[:keyword]


    # get the seacrch keyword from wechat miniprogram
    # search using .where to find record
    #
  end

  def show; end

  def update
    if @story.update(stories_params)
      render :show
    else
      render_error
    end
  end

  def create
    @story = Story.new(stories_params)

    if @story.save
      render :show, status: :created
    else
      render :render_error
    end
  end

  def destroy
    @story.destroy
    head :no_content
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def stories_params
    params.require(:story).permit(:name, :text, :image_url)
  end

  def render_error
    # error = @story.errors
    render json: { errors: @story.error.full_messages }
  end
end
