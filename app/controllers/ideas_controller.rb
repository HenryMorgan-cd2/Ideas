class IdeasController < ApplicationController

  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @q = Idea.joins(:tags).ransack(search: params[:q], tags_name_eq: params[:tag])
    @ideas = @q.result(distinct: true)
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path, notice: 'Idea Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to root_path, notice: 'Idea Updated!'
    else
      render :show
    end
  end

  def destroy
    if @idea.destroy
      redirect_to root_path, notice: 'Idea Destroyed!'
    else
      redirect_to root_path, flash: {error: 'Can\'t Delete that idea.'}
    end
  end


  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(
      :name, :body, :tag_list, :category_id,
      new_resources: [], resources_attributes: [:id, :_destroy, :file, :file_cache])
  end

end
