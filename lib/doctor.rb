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
      doc_id = doctor["doc_id"]
      doc_name = doctor["doc_name"]
      doc_spec = doctor["doc_spec"]
      doctors.push(Doctor.new({:doc_id => doc_id, :doc_name => doc_name, :doc_spec => doc_spec}))
    end
    doctors
  end




end
