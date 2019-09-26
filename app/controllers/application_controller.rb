class ApplicationController < ActionController::Base
    before_filter :configure_permitted_paramaters, if: :devise_controller?
    protected
    def configure_permitted_paramaters
        devise_paramter_sanitizer.for(:sing_up){ |u| u.permit(:name,:stripe_card_token,:email,:password,:password_confirmation)}
    end
end
