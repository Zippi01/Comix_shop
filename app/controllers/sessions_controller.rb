class SessionsController < ApplicationController
  def new;end

  def create
    if login(params[:email], params[:password])
      flash[:success] = "#{t("flash.controller.message1")}"
      redirect_to product_index_path
    else
      flash.now[:warning] = "#{t("flash.controller.message2")}"
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "#{t("flash.controller.message3")}"
    redirect_to log_in_path
  end
end
