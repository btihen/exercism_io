defmodule Gigasecond do

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer},
              {pos_integer, pos_integer, pos_integer}}
            ) ::  :calendar.datetime()


  def from({{year, month, day}, {hours, minutes, seconds}} = datetime) do
    # DateTime functions USE UTC!
    datetime = %DateTime{ year: year, month: month, day: day,
                          hour: hours, minute: minutes, second: seconds,
                          microsecond: {0, 0},
                          utc_offset: 0, std_offset: 0,
                          zone_abbr: "UTC", time_zone: "Etc/UTC"}
    # add 1_000_000_000 seconds to date
    new_datetime = DateTime.add(datetime, 1000000000, :second, Calendar.UTCOnlyTimeZoneDatabase)

    # format output
    { {new_datetime.year,  new_datetime.month,    new_datetime.day},
      {new_datetime.hour, new_datetime.minute,  new_datetime.second} }
  end

end
