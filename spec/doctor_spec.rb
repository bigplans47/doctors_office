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
end







# describe ("add a doctor") do
#     it("allows you to add a doctor") do
#      doctor1 = Doctor.new({:name => "Cody Smith", :speciality => "cancer", :id => nil})
#      doctor1.save
#      doc_array.push(doctor1)
#      expect(doctor_array).to(eq(doctor1))
#    end
#  end
