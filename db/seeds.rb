# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# User Seeds
User.create(
  name: "John Doe",
  email: "john@test.com",
  password: "password",
  password_confirmation: "password"
)

User.create(
  name: "Jane Doe",
  email: "jane@test.com",
  password: "password",
  password_confirmation: "password"
)

User.create(
  name: "Kyle Pazdel",
  email: "kyle@test.com",
  password: "password",
  password_confirmation: "password"
)

47.times do
  User.create(
    name: FFaker::Name.name,
    email: FFaker::Internet.safe_email,
    password: "password",
    password_confirmation: "password"
  )
end
