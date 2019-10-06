module UsersHelper
    def job_title_icon
        if @user.profile.job_title == "Developer"
            '<i class="fa fa-code job-title-icon job-developer-icon"></i>'.html_safe
        elsif @user.profile.job_title == "Entrepreneur"
                '<i class="fa fa-lightbulb job-title-icon job-entrepreneur-icon"></i>'.html_safe
        elsif @user.profile.job_title == "Investor"
            '<i class="fa fa-euro-sign job-title-icon job-investor-icon"></i>'.html_safe
        end
    end

    def job_title_class
        if @user.profile.job_title == "Developer"
            'job-developer-icon'.html_safe
        elsif @user.profile.job_title == "Entrepreneur"
                'job-entrepreneur-icon'.html_safe
        elsif @user.profile.job_title == "Investor"
            'job-investor-icon'.html_safe
        end
    end
end
