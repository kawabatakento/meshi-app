class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
    
    if params[:gender_id].present?
      @prototypes = @prototypes.where(gender_id: params[:gender_id])
    end
  
    if params[:age_id].present?
      @prototypes = @prototypes.where(age_id: params[:age_id])
    end
  end

  def new
    @prototype = Prototype.new
  end

  def create
  @prototype = Prototype.new(prototype_params)
    if @prototype.save
    redirect_to root_path
   else
    render :new
   end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments 
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user.id == @prototype.user_id
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if current_user.id == @prototype.user_id
      @prototype.destroy
    end
    redirect_to root_path
  end

  private

  def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :gender_id, :age_id, :occupation_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end
end
