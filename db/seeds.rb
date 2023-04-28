include Devise::Controllers::Helpers
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# second_group = Group.new(name: "tity", icon: "https://static.thenounproject.com/png/1459620-200.png", first_user)
  # movies = User.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.new(name: "ifeanyi", email: "otijoseph305@gmail.com", password: "ifyjapan", password_confirmation: "ifyjapan")
confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
first_user.confirmation_token = confirmation_token[0]
first_user.confirmed_at = Time.now.utc


if first_user.save!
  puts "first user created successfully"
end


first_group = Group.create(name: "entity", icon: "https://media.flaticon.com/dist/min/img/logo/flaticon_negative.svg", user: first_user)
first_transfer = Transfer.create(name: 'John Doe', amount: 20, author: first_user, groups: [first_group])
