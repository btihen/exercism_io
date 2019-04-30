defmodule Gigasecond do

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer},
              {pos_integer, pos_integer, pos_integer}}
            ) ::  :calendar.datetime()


  # @gigasecond 1_000_000_000
  # def from({{year, month, day}, {hours, minutes, seconds}} = datetime) do
  #   datetime
  #   |> :calendar.datetime_to_gregorian_seconds()
  #   |> Kernel.+(@gigasecond)
  #   |> :calendar.gregorian_seconds_to_datetime()
  # end

  # def from(datetime) do
  #    datetime
  #    |> :calendar.datetime_to_gregorian_seconds()
  #    |> add_a_billion()
  #    |> :calendar.gregorian_seconds_to_datetime()
  #  end
  #  defp add_a_billion(n) do
  #    n + 1_000_000_000
  #  end

  def from(birthdate) do
    birthdate_seconds = :calendar.datetime_to_gregorian_seconds(birthdate)
    :calendar.gregorian_seconds_to_datetime(birthdate_seconds + 1000000000)
  end

  # def from({{year, month, day}, {hours, minutes, seconds}}) do
  #   %DateTime{
  #     year: year, month: month, day: day,
  #     hour: hours, minute: minutes, second: seconds,
  #     zone_abbr: "UTC", utc_offset: 0, std_offset: 0, time_zone: "Etc/UTC"
  #   }
  #   |> DateTime.add(1_000_000_000, :second)
  #   |> (&({{&1.year, &1.month, &1.day}, {&1.hour, &1.minute, &1.second}})).()
  # end

  # def from({{year, month, day}, {hours, minutes, seconds}} = datetime) do
  #   # DateTime functions USE UTC!
  #   datetime = %DateTime{ year: year, month: month, day: day,
  #                         hour: hours, minute: minutes, second: seconds,
  #                         microsecond: {0, 0},
  #                         utc_offset: 0, std_offset: 0,
  #                         zone_abbr: "UTC", time_zone: "Etc/UTC"}
  #   new_datetime = DateTime.add(datetime, 1000000000, :second, Calendar.UTCOnlyTimeZoneDatabase)
  #
  #   # format output
  #   { {new_datetime.year,  new_datetime.month,    new_datetime.day},
  #     {new_datetime.hour, new_datetime.minute,  new_datetime.second} }
  # end
end
