class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @order = params[:order]
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end

  def edit_data()
    @order = params[:order]
    mail(to: @order.email, subject: "Edit status to #{@order.status}")
  end
end
