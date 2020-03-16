module ControllerMacros
	def login(account)
	  @request.env["devise.mapping"] = Devise.mappings[:account]
	  sign_in account
	end
  end