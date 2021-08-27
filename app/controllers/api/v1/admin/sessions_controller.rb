class Api::V1::Admin::SessionsController < ApplicationController
  before_action :authenticate_account_administrator!, only:[:destroy]
  

  def create
    
    params_required!(:email, :password)

    # WARNING: To avoid giving hints for malicious users, lets have a safe (generic) error message
    unless account = Account::Administrator.find_by(email: params[:email])
      return render_error(compose_msg(:error, "Invalid email/password."), 401)
    end

    unless account.valid_password?(params[:password])
      return render_error(compose_msg(:error, "Invalid email/password."), 401)
    end

    generate_and_attach_session_token(account)
    render_success(data: to_admin_json(account))
  end

  def destroy
    current_account_administrator&.update(tokens: {})
    render_success
  end
end
