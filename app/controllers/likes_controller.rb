class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @dog = Dog.find(params[:dog_id])
    @like = Like.new(user: current_user, dog: @dog)

    if @dog.user != current_user 
      if @like.save
        respond_to do |format|
          format.html { redirect_to @dog, notice: 'Like was successfully created.' }
          format.json { render :show, status: :created, location: @dog }
        end
      else
        respond_to do |format|
          format.html { redirect_to @dog, notice: 'Like has already been created.' }
          format.json { render json: @dog.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @dog, notice: 'You can only like a dog that you do not own.' }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end


end