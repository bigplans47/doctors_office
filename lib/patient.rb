class Patient

  attr_reader(:pat_id, :pat_name, :pat_birthday, :pat_doctor)

  def initialize(attributes)
  @pat_id = attributes[:pat_id]
  @pat_name = attributes[:pat_name]
  @pat_birthday = attributes[:pat_birthday]
  @pat_doctor = attributes[:pat_doctor]
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      id = patient("pat_id")
      name = patient("pat_name")
      birthday = patient("pat_birthday")
      doctor_of_patient = patient("pat_doctor")
      patients.push(Patients.new({:pat_id => id, :pat_name => name, :pat_birthday => birthday, :pat_doctor => doctor_of_patient}))
    end
    patients
  end

  




end
