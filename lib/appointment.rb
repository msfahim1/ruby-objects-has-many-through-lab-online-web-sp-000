class Appointment

  attr_accessor :patient, :doctor, :date

  @@all = []

  def self.all
    @@all
  end

  def initialize(patient, doctor, date)
    @patient = patient
    @doctor = doctor
    @date = date
    #Update doctor data fields
    @doctor.patients << patient
    @doctor.appointments << self
    #Update patient data fields
    @patient.doctors << doctor
    @patient.appointments << self

    @@all << self
  end
end