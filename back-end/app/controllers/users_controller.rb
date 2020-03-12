class UsersController < ApplicationController
    before_action :authorized, only: [:persist]

    def index 
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            wristband = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: wristband}
        
            # respond_to do |format|
            #     if @user.valid?
                  # Tell the UserMailer to send a welcome email after save
            UserMailer.welcome_email(@user).deliver
            #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
            #       format.json { render json: @user, status: :created, location: @user }
            #     else
            #       format.html { render action: 'new' }
            #       format.json { render json: @user.errors, status: :unprocessable_entity }
            #     end
            # end
        
        else
            render json: {error: "Invalid username or password"}
        end

    end

    def login
        @user = User.find_by(username: params[:username])
        # byebug
        if @user && @user.authenticate(params[:password])
          wristband = encode_token({user_id: @user.id})
          render json: {user: UserSerializer.new(@user), token: wristband}
        else
          render json: {error: "Invalid username or password"}
        end
    end
    
    def persist
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
    end
    
    private
    def user_params
        params.permit(:username, :password, :image, :interest, :email)
    end

end
