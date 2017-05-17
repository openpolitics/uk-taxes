Given(/^I am employed by "([^"]*)"$/) do |name|
  @employers ||= {}
  @employers[name] = {
    name: name
  }
end

Given(/^"([^"]*)" pays me £(\d+) per year on PAYE$/) do |name, salary|
  @employers[name][:salary] = salary.to_f
end