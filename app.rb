require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'the_office'})

get('/') do
  @doctors = Doctor.all
  erb(:index)
end

post('/') do
  doc_name = params['doc_name']
  doc_spec = params['doc_spec']
  new_doctor = Doctor.new({:doc_id => nil, :doc_name => doc_name, :doc_spec => doc_spec})
  new_doctor.save
  @doctors = Doctor.all
  erb(:index)
end

get('/lists/:doc_id') do
  @doctor_id = params[:doc_id]
  @doctor = Doctor.find(params.fetch("doc_id").to_i())
  binding.pry
  erb(:list)
end

post('/lists/:doc_id') do
  @doctor_id = params[:doc_id]
  @doctor = Doctor.find(params.fetch("doc_id").to_i())
  # binding.pry
  # task = params['task']
  # due_date = params['due_date']
  # new_task = Task.new({:description => task, :due_date => due_date, :list_id => @list_id})
  # new_task.save
  @patient = Patient.all
  erb(:list)
end
