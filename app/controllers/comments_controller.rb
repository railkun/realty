class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @property = Property.find(params[:property_id])
      @comment = @property.comments.new(comment_params)
      @comment.user = current_user
      @comment.save
      redirect_to property_path(@property)
    end

    def destroy
      @property = Property.find(params[:property_id])
      @comment = @property.comments.find(params[:id])
        if @comment.user == current_user
          @comment.destroy
        else
        end
      redirect_to property_path(@property)
    end

    private

    def comment_params
      params.require(:comment).permit(:nickname, :description)
    end


end
