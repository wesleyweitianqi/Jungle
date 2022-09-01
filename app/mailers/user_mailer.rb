class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  def welcome_email 
    @user = params[:user]
    @url ='localhost:3000/login'
    mail(to: @user.email, subject: "Welcome to Jungle")
  end 
  
  def receipt_email
    @user = params[:user]
    @order = params[:order]
   
    @url ='localhost:3000'
    mail(to: @user.email, subject: "Order confirmed")
  end 
end
