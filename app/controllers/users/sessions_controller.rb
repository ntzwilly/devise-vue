class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: "You are logged in",
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    head :ok
  end

  def log_out_success
    render json: {
      message: "You are logged out"
    }, status: :ok
  end

  def logout_failure
    render json: {
      message: "Hmm nothing happened"
    }, status: :unauthorized
  end
end