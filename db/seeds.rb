# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    p=Admin.create(:name=>'admin',:email=>'admin@ncsu.edu',:password=>'admin123',:password_confirmation=>'admin123')
    p.save
    x=Library.create(:name=>'test',:location=>'hilsborough',:borrow_limit=>2,:overdue_fines=>25,:university_id=>1)
    x.save

    University.create(name:"NCSU")
    University.create(name:"Duke")
    University.create(name:"CLemson")
    University.create(name:"UNCC")
