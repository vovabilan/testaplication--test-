# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p "create companies"
Company.create(name: "Nokia", email: "nokia@example.com")
Company.create(name: "Philips", email: "philips@example.com")

p "create users"
User.create(
  {email: "mack-d@ukr.net", password: "12345", company_id: Company.first.id, supper_admin: true,
   avatar: Rack::Test::UploadedFile.new( Rails.root.join("spec", "images", "user-avatar.png"), "image/png")
  },
 without_protection: true
)
User.create( email: "mack-d@bigmir.net", password: "12345", company_id: Company.first.id,
  avatar: Rack::Test::UploadedFile.new( Rails.root.join("spec", "images", "user-avatar.png"), "image/png"))
User.create( email: "vovabilan89@gmail.com", password: "12345", company_id: Company.first.id,
  avatar: Rack::Test::UploadedFile.new( Rails.root.join("spec", "images", "user-avatar.png"), "image/png"))
User.create( email: "vovabilan89@ukr.net", password: "12345", company_id: Company.first.id,
  avatar: Rack::Test::UploadedFile.new( Rails.root.join("spec", "images", "user-avatar.png"), "image/png"))

p "create categoryies"
Category.create(name: "Smartfon", company_id: Company.first.id)
Category.create(name: "fon", company_id: Company.first.id)
Category.create(name: "vacuum cleaner", company_id: Company.find_by_id(2).id)