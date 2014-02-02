module ObjectCreationMethods
  def stub_omniauth_login
    ::UserStatSync.stub(:after)  
    activate_omni_auth_test_mode
    OmniAuth.config.mock_auth[:github] = omni_auth_attributes
  end

  def omni_auth_attributes
    OmniAuth::AuthHash.new({
      provider: "github",
      uid: "321654",
      info: {
        name: "bob smith",
        nickname: "bobsmith",
        image: "http://placehold.it/50/50",
        email: "example@example.com"},
      credentials: {
        secret: "secret",
        token: "token"},
    })
  end

  def activate_omni_auth_test_mode
    OmniAuth.config.test_mode = true
  end


end