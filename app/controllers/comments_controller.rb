class CommentsController < ApplicationController
   before_action :authenticate_user!, :only => [:create, :destroy]

   def create
     @comment = Comment.new(comment_params)
     @comment.user = current_user
     @comment.product = Product.find(params[:product_id])

     @comment.save
     render :json => {:comment => @comment}
   end

   def destroy
     @comment = current_user.comments.find(params[:id]) # 只能删除自己的贴文
     @comment.destroy

     render :json => { :id => @comment.id }
   end

   protected

   def comment_params
     params.require(:comment).permit(:content, :product_id)
    end
end
