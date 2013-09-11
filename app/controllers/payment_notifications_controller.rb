class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  before_action :set_payment_notification, only: [:show, :edit, :update, :destroy]

  # GET /payment_notifications
  # GET /payment_notifications.json
  def index
    @payment_notifications = PaymentNotification.all
  end

  # GET /payment_notifications/1
  # GET /payment_notifications/1.json
  def show
  end

  # GET /payment_notifications/new
  def new
    @payment_notification = PaymentNotification.new
  end

  # GET /payment_notifications/1/edit
  def edit
  end

  # POST /payment_notifications
  # POST /payment_notifications.json
  def create
    # @payment_notification = PaymentNotification.new(payment_notification_params)

    # respond_to do |format|
    #   if @payment_notification.save
    #     format.html { redirect_to @payment_notification, notice: 'Payment notification was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @payment_notification }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @payment_notification.errors, status: :unprocessable_entity }
    #   end
    # end

    @notification = PaymentNotification.new
    @notification.transaction_id  = params[:ipn_track_id]
    @notification.params          = params.to_s
    @notification.status          = params[:payment_status]

    @custom = Base64.decode64(params[:custom])
    @custom = @custom.split("|")
    @user   = User.new
    @user.email = @custom[0]
    @user.password = @custom [1]

    if @user.save
      @notification.user = @user
      @notification.save
    end

    render :nothing => true
  end

  # PATCH/PUT /payment_notifications/1
  # PATCH/PUT /payment_notifications/1.json
  def update
    respond_to do |format|
      if @payment_notification.update(payment_notification_params)
        format.html { redirect_to @payment_notification, notice: 'Payment notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_notifications/1
  # DELETE /payment_notifications/1.json
  def destroy
    @payment_notification.destroy
    respond_to do |format|
      format.html { redirect_to payment_notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_notification
      @payment_notification = PaymentNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_notification_params
      params.require(:payment_notification).permit(:user, :params, :status, :transaction_id, :create)
    end
end
