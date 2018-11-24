class ContactMailer < ApplicationMailer
    def contact_mail(blog)
        @blog = blog
        @user = @blog.user
        mail to: @user.email ,subject: "作成完了"
    end
end
