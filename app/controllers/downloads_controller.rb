class DownloadsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :free, :verify]

  def index
  	respond_to do |format|
      format.html
      format.js
    end
  end

  def free
  	redirect_to 'http://cl.ly/image/0q1v2V3I1a43'
  end

  def pro
  	download = Download.new
  	redirect_to download.authenticated_url
  end

  def verify
    @paypment = PaymentNotifications.find_by transaction_id: params[:ipn_track_id]
    @user = User.find(@paypment.user)

    unless @paypment && @user
      raise ArgumentError.new("Something went wrong, please contact adminstrator!")
    end

    sign_in @user, :event => :authentication

  end

end
