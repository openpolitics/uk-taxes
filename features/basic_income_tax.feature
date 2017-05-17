Feature: Basic income taxes
  As an employee
  In order to work out my tax liability
  I want to know how much I should pay in tax

Scenario: zero rate income tax
  Given I am employed by "Employer 1"
  And "Employer 1" pays me £10000 per year on PAYE
  And no other taxes apply
  When my taxes are calculated
  Then I should pay £0 in income tax
  And I should pay £220.32 in national insurance
  And I should take home £9779.68 per year
  And "Employer 1" should pay £253.37 in employer's national insurance
  
Scenario: basic rate income tax
  Given I am employed by "Employer 1"
  And "Employer 1" pays me £20000 per year on PAYE
  And no other taxes apply
  When my taxes are calculated
  Then I should pay £1700 in income tax
  And I should pay £1420.32 in national insurance
  And I should take home £16879.68 per year
  And "Employer 1" should pay £1633.37 in employer's national insurance
  
Scenario: higher rate income tax
  Given I am employed by "Employer 1"
  And "Employer 1" pays me £50000 per year on PAYE
  And no other taxes apply
  When my taxes are calculated
  Then I should pay £8700 in income tax
  And I should pay £4523.52 in national insurance
  And I should take home £36776.48 per year
  And "Employer 1" should pay £5773.37 in employer's national insurance
