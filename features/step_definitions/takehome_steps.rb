Then(/^I should take home £([\d\.]+) per year$/) do |value|
  expect(@takehome).to eq value.to_f
end