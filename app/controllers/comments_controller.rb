class CommentsController < ApplicationController
  before_action :find_product

  def index
    @product.comments = @product.comments.arrange(order: :created_at)
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @comment = Product.friendly.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
      flash[:error] = "You must rate product and write a comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :minus, :plus, :rating)
  end

  def find_product
    @product = Product.friendly.find(params[:product_id])
  end
end
