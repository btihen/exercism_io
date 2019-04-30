class SpaceAge

  EARTH_YEAR_IN_SECONDS     = 31557600
  PLANET_CONVERSION_RATIOS  = { earth:     1.0,
                                mercury:   0.2408467,
                                venus:     0.61519726,
                                mars:      1.8808158,
                                jupiter:  11.862615,
                                saturn:   29.447498,
                                uranus:   84.016846,
                                neptune: 164.79132,
                              }
  def initialize age_in_secs
    @age_in_secs = age_in_secs
  end

  def method_missing(method_name, *args, &block)
    super unless respond_to?(method_name)

    planet = get_planet(method_name)
    new_planet_years planet
  end

  def respond_to?(method_name, include_private = false)
    planet = get_planet method_name
    PLANET_CONVERSION_RATIOS[planet] || super
  end

  private

  attr_reader :age_in_secs

  def new_planet_years planet
    earth_years = age_in_secs / EARTH_YEAR_IN_SECONDS.to_f
    earth_years / PLANET_CONVERSION_RATIOS[planet]
  end

  def get_planet on_planet
    on_planet.to_s.split('_').last.to_sym
  end

end
