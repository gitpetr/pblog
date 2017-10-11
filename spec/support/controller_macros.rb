module ControllerMacros
  def login_admin
    before do
      @admin = create(:admin)
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in @admin
    end
    end

  def login_user
    before do
      @user = create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @user
    end
  end
end
