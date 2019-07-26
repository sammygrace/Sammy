class CommentsMailer < ApplicationMailer
  def notify_vendor(comment)
    @vendor = comment.vendor
    mail(to: @vendor.email, subject: 'Someone commented on your business!')
  end
end
