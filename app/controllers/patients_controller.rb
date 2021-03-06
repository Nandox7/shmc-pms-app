class PatientsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    if params[:search]
      # select all patients which match the search pattern
      @patients = Patient.search(params[:search])
      # sort results by first name
      @patients = @patients.order("firstname DESC")
    else
      # order all patients by firstname
      @patients = @patients.order("firstname DESC")
    end
    
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
		#@patient_appointments = Appointment.find(params[:patient_id])
		@patient.appointments
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_patient_email
    # Get patient by id
    @patient =  Patient.find(params[:id])
    # Send and email with the patient details
    PatientMailer.welcome_email(@patient).deliver_now
    redirect_to patient_path(params[:id])
  end
  helper_method :send_patient_email
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:firstname, :lastname, :dateofbirth, :address, :contact, :details, :special)
    end
end
