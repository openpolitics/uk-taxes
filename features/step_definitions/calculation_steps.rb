Given(/^no other taxes apply$/) do
end

When(/^my taxes are calculated$/) do

  # Gross income across all employers
  @employers.each_pair do |name, employer| 
    employer[:income_tax] = calculate_banded_percentage($income_tax_bands, employer[:salary])
    employer[:class_1_nic] = calculate_banded_percentage($ni_category_a_bands, employer[:salary])
    employer[:employers_nic] = calculate_banded_percentage($employers_ni_category_a_bands, employer[:salary])
    employer[:deductions] = employer[:class_1_nic] + employer[:income_tax]
    employer[:takehome] = (employer[:salary] - employer[:deductions]).round(2)
  end
  
  @takehome = @employers.inject(0.0) do |total, employer| 
    total + employer[1][:takehome]
  end
  
  @income_tax = @employers.inject(0.0) do |total, employer| 
    total + employer[1][:income_tax]
  end
  
  @class_1_nics = @employers.inject(0.0) do |total, employer| 
    total + employer[1][:class_1_nic]
  end

end