require 'shouty'

Given(/^the following subscribers$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  @network = Network.new
  @people = {}
  table.hashes.each do |person|
    @people[person["name"]] = Person.new(@network, person["location"].to_f)
  end
end

When(/^([a-zA-Z]+) shouts "([^"]*)"$/) do |person, message|
  @message = message
  @people.fetch(person).shout(message)
end

Then(/^([a-zA-Z]+) hears ([a-zA-Z]+)'s message$/) do |person1, person2|
  expect(@people.fetch(person1).messages_heard).to include(@message)
end

Then(/^([a-zA-Z]+) does not hear ([a-zA-Z]+)'s message$/) do |person1, person2|
  expect(@people.fetch(person1).messages_heard).not_to include(@message)
end

# When(/^Lucy moves to (\d+)m from Sean$/) do |distance|
#   @lucy.move_to(distance)
# end