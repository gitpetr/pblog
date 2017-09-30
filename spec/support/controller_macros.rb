module ControllerMacros
  def login_admin
    before do
      @admin = create(:admin)
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in @admin
    end
  end
end
