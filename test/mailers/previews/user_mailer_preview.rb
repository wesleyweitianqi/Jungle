class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user: User.first).welcome_email
  end

  def receipt_email
    @user = User.first
    @order = Order.first
    UserMailer.with(user: @user, order: @order).receipt_email
  end

end
