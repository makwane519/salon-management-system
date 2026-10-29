class StaffsController < ApplicationController
  before_action :authorize_admin_or_receptionist!, only: %i[index show]
  before_action :authorize_admin!, only: %i[new create edit update destroy]
  before_action :set_staff, only: %i[ show edit update destroy ]

  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs or /staffs.json
    # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)

    email = @staff.email.to_s.strip.downcase

    if email.blank?
      @staff.errors.add(:email, "is required to create a staff login")
      return render_create_errors
    end

    if User.exists?(email_address: email)
      @staff.errors.add(:email, "is already registered with an account")
      return render_create_errors
    end

    @staff.email = email
    user = nil

    begin
      User.transaction do
        temporary_password = SecureRandom.urlsafe_base64(32)

        user = User.create!(
          email_address: email,
          password: temporary_password,
          password_confirmation: temporary_password,
          role: "staff"
        )

        @staff.user = user
        @staff.save!
      end
    rescue ActiveRecord::RecordInvalid => e
      unless e.record == @staff
        @staff.errors.add(:email, e.record.errors.full_messages.to_sentence)
      end

      return render_create_errors
    rescue ActiveRecord::RecordNotUnique
      @staff.errors.add(:email, "is already registered with an account")
      return render_create_errors
    end

    PasswordsMailer.reset(user).deliver_later

    respond_to do |format|
      format.html do
        redirect_to @staff,
                    notice: "Staff created. Password setup instructions have been queued for email."
      end
      format.json do
        render :show, status: :created, location: @staff
      end
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: "Staff was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @staff.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy!

    respond_to do |format|
      format.html { redirect_to staffs_path, notice: "Staff was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params.expect(:id))
    end
    
    def render_create_errors
      respond_to do |format|
        format.html do
          render :new, status: :unprocessable_content
        end
        format.json do
          render json: @staff.errors, status: :unprocessable_content
        end
      end
    end
    
    # Only allow a list of trusted parameters through.
    def staff_params
      params.expect(staff: [ :name, :role, :phone, :email, :salary, :joining_date, :active ])
    end
end
