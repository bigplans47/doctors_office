require('rspec')
require('pry')
require('doctor')
require('spec_helper')
require('pg')

DB = PG.connect({:dbname => "the_office_test"})

describe(Doctor) do
  describe('.all') do
    it('starts with no lists') do
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the information of the doctor into our server') do
      doctor = Doctor.new({:doc_id => nil, :doc_name => "Dr.Ben", :doc_spec => "Optomitrist"})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#doc_name") do
    it("will show the name of a doctor") do
    doctor = Doctor.new({:doc_id => nil, :doc_name => "Dr. Oz", :doc_spec => "treatment"})
    # doctor.save
    binding.pry
    expect(doctor.doc_name()).to(eq("Dr. Oz"))
    end
  end


  describe("#==") do
    it("is the same list if it has the same name") do
      doctor1 = Doctor.new({:doc_id => nil, :doc_name => "Dr.Ben", :doc_spec => "Optomitrist"})
      doctor2 = Doctor.new({:doc_id => nil, :doc_name => "Dr.Ben", :doc_spec => "Optomitrist"})
      expect(doctor1).to(eq(doctor2))
    end
  end
end







# describe ("add a doctor") do
#     it("allows you to add a doctor") do
#      doctor1 = Doctor.new({:name => "Cody Smith", :speciality => "cancer", :id => nil})
#      doctor1.save
#      doc_array.push(doctor1)
#      expect(doctor_array).to(eq(doctor1))
#    end
#  end
