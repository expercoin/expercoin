class CitiesAndStatesFromCountry
  def initialize(country, state = nil)
    @country = country
    @state = state
  end

  def states
    CS.states(country_key)
  end

  def cities
    CS.cities(state_key, country_key)
  end

  private

  def country_key
    CS.countries.select do |c|
      CS.countries[c] == @country
    end.keys.first
  end

  def state_key
    states.select do |s|
      CS.states(country_key)[s] == @state 
    end.keys.first
  end
end
