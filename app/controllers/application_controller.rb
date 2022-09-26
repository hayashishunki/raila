class ApplicationController < ActionController::Base
    before_action :set_current_user

    def user_not_authorized
        redirect_to (request.referrer || root_path), flash: { notice: '権限がありません。' } unless @current_user
    end

    def limit_login_user
        if @current_user
            redirect_to '/posts/index', flash: { notice: 'すでにログインしています' }
        end
    end

    private
    def set_current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
end
