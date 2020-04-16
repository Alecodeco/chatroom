# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:"code", password:"aijunale", superuser: true, status:"Online",
  has_dark_active:false, description:"this is code")
User.create(username:"lolo", password:"password", superuser: false, status:"Online",
  has_dark_active:false, description:"this is lolo")
User.create(username:"altaria", password:"password", superuser: false, status:"Away",
  has_dark_active:false, description:"this is noone")
User.create(username:"naveruin", password:"password", superuser: false, status:"Busy",
  has_dark_active:false, description:"still noone")
