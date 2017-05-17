Then(/^I should pay £(\d+) in income tax$/) do |arg1|
  expect(@income_tax).to eq arg1.to_f
end