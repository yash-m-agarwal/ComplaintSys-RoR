# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mario = User.create(first_name: 'Mario', last_name: 'Moto', email: 'mario@email.com', password: 'Mario1', password_confirmation: 'Mario1')
Complaint.create(title: 'Hostel issue', description: 'Block no: 4, Room no: 9. Tubelight is dysfunctional.', status: 'Pending', user_id: mario.id)
Complaint.create(title: 'Hostel issue', description: 'Block no: 4, Ground Floor. Water-cooler is not working properly.', status: 'Pending', user_id: mario.id)

sam = User.create(first_name: 'Sam', last_name: 'Summer', email: 'sam@email.com', password: 'Sam1', password_confirmation: 'Sam1')
Complaint.create(title: 'Mess issue', description: 'Block no: 4. Mess-food is distorted.', status: 'Pending', user_id: sam.id)
Complaint.create(title: 'Academic issue', description: 'LHC-C, CR-2. Mic is dysfunctional.', status: 'Pending', user_id: sam.id)

admin = User.create(first_name: 'admin', last_name: 'admin', email: 'admin@email.com', password: 'Admin1', password_confirmation: 'Admin1', role: 'admin')