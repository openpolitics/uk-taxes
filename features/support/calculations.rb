$income_tax_bands = [
  {
    upper_threshold: 11500.0,
    rate: 0.0
  },
  {
    upper_threshold: 45000.0,
    rate: 0.2
  },
  {
    upper_threshold: nil,
    rate: 0.4
  },
]

$ni_category_a_bands = [
  {
    upper_threshold: 8164.0,
    rate: 0.0
  },
  {
    upper_threshold: 45032.0,
    rate: 0.12
  },
  {
    upper_threshold: nil,
    rate: 0.02
  },
]

$employers_ni_category_a_bands = [
  {
    upper_threshold: 8164.0,
    rate: 0.0
  },
  {
    upper_threshold: 45032.0,
    rate: 0.138
  },
  {
    upper_threshold: nil,
    rate: 0.138
  },
]

def calculate_banded_percentage(bands, value)
  previous_threshold = 0.0
  result = 0.0
  bands.each do |band|
    amount_in_band = begin
      if band[:upper_threshold] && band[:upper_threshold] < value
        band[:upper_threshold] - previous_threshold
      else 
        value - previous_threshold
      end
    end
    if amount_in_band > 0.0
      result += amount_in_band * band[:rate]
    end
    previous_threshold = band[:upper_threshold]
  end
  result.round(2)
end