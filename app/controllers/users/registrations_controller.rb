class Users::RegistrationsController < Devise::RegistrationsController

    def create
        super do |resource|
            if params[:plan]
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    if params[:stripe_card_token]
                        resource.stripe_card_token = params[:stripe_card_token]
                    end
                    resource.save_with_payment
                else
                    resource.save
                end
            end
        end
    end
end

