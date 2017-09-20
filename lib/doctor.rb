class Doctor
  attr_reader(:doc_id, :doc_name, :doc_spec)

  def initialize(attributes)
    @doc_id = attributes[:doc_id]
    @doc_name = attributes[:doc_name]
    @doc_spec = attributes[:doc_spec]
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      doc_id = doctor["doc_id"].to_i
      doc_name = doctor["doc_name"]
      doc_spec = doctor["doc_spec"]
      doctors.push(Doctor.new({:doc_id => doc_id, :doc_name => doc_name, :doc_spec => doc_spec}))
    end
    doctors
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.doc_id.to_i.==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def save
    result = DB.exec("INSERT INTO doctors (doc_name, doc_spec) VALUES ('#{@doc_name}', '#{@doc_spec}') RETURNING doc_id; ")
    @doc_id = result.first["doc_id"].to_i
    # @doc_id = result[0].doc_id.to_i
  end

  def ==(another_doctor)
    self.doc_name().==(another_doctor.doc_name()).&self.doc_id().==(another_doctor.doc_id()).&self.doc_spec().==(another_doctor.doc_spec())
  end

  def patients
  list_patients = []
  patients = DB.exec("SELECT * FROM patients WHERE pat_doctor = 1;")
  # patients = DB.exec("SELECT * FROM patients WHERE pat_doctor = #{self.doc_id()};")
  patients.each() do |patient|
    pat_id = patient.fetch("pad_id").to_i()
    pat_name = patient.fetch("pat_name")
    pat_doctor = patient.fetch('pat_doctor').to_i()
    pat_birthday = patient.fetch('pat_birthday')
    list_patients.push(Patient.new({:pat_id => pat_id, :pat_name => pat_name, :pat_doctor => pat_doctor, :pat_birthday => pat_birthday}))
  end
  list_patients
  end
end
