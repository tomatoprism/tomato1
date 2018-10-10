class ApplicationController < ActionController::Base


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_kana, :name, :mail, :phone, :post_code, :address])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:mail])
  end

end
