module UserHelpers
  def login_as(name)
    case name
    when ActiveRecord::Base
      @user = name
    when Symbol 
      # blueprint
      @user = User.make(name, :password => 'password1')
    when String
      # role
      @user = User.make(:password => 'password1')
      @user.has_role!(name)
    end

    visit new_user_session_path
    fill_in 'username', :with => @user.username
    fill_in 'password', :with => @user.password
    click_button
  end

  def logged_in_user
    @user
  end
end

World(UserHelpers)
