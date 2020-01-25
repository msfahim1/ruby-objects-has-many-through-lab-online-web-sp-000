class Patient 
  #has many appointments 
  #has many doctors through appointments
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
    @@all 
  end

  def appointments 
    Appointment.all.select do |appt| 
      appt.patient == self 
    end
  end
 
  def schedule_appointment(doctor, time)
    Appointment.new(self, doctor, date='tbd', time)
  end

  def self.find_by_name(patient_name)
    self.all.find do |patient|
      patient.name == patient_name
    end
  end

  def find_doc(spec)
    Doctor.find_by_specialty(spec)
  end

end 