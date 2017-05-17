Then(/^I should pay £([\d\.]+) in national insurance$/) do |value|
  expect(@class_1_nics).to eq value.to_f

end

Then(/^"([^"]*)" should pay £([\d\.]+) in employer's national insurance$/) do |name, value|
  expect(@employers[name][:employers_nic]).to eq value.to_f
end