require('rspec')
require('pry')
require('patient')
require('spec_helper')

DB = PG.connect({:dbname => 'the_office_test'})

describe(Patient) do

  describe('.all') do
    it("will show an empty array at the start") do
      expect(Patient.all).to eq([])
    end
  end

  describe("#id") do
  it("tells you its id") do
    patient = Patient.new({:pat_id => 2, :pat_name => "Bob Smith Dinkin", :pat_birthday => '1969-05-01', :pat_doctor => "Dr. Phil"})
    expect(patient.pat_id()).to(eq(2))
  end
end

  describe("#name") do
    it("tells you its name") do
      patient = Patient.new({:pat_id => nil, :pat_name => "Bob Smith Dinkin", :pat_birthday => '1969-05-01', :pat_doctor => "Dr. Phil"})
      expect(patient.pat_name()).to(eq("Bob Smith Dinkin"))
    end
  end

  describe("#birthday") do
    it("tells you its birthday") do
      patient = Patient.new({:pat_id => nil, :pat_name => "Bob Smith Dinkin", :pat_birthday => '1969-05-01', :pat_doctor => "Dr. Phil"})
      expect(patient.pat_birthday()).to(eq('1969-05-01'))
    end
  end

  describe("#doctor_of_patient") do
    it("show name of patients doctor") do
      patient = Patient.new({:pat_id => nil, :pat_name => "Bob Smith Dinkin", :pat_birthday => '1969-05-01', :pat_doctor => "Dr. Phil"})
      # patient.save()
      expect(patient.pat_doctor()).to(eq("Dr. Phil"))
    end
  end


end
