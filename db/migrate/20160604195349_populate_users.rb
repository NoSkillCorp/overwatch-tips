class PopulateUsers < ActiveRecord::Migration
  def change
    user_cookies = Vote.uniq.pluck(:user_cookie)
    user_cookies.each do |user_cookie|
      User.create(user_cookie: user_cookie)
    end
  end
end
