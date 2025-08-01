defmodule LibraryFees do
  @noon ~T[12:00:00]

  def datetime_from_string(string) do
    {_, datetime} = NaiveDateTime.from_iso8601(string)
    datetime
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    Time.compare(time, @noon) == :lt
  end

  def return_date(checkout_datetime) do
    date = NaiveDateTime.to_date(checkout_datetime)
    if before_noon?(checkout_datetime), do: Date.add(date, 28), else: Date.add(date, 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_date = NaiveDateTime.to_date(actual_return_datetime)
    diff = Date.diff(actual_date, planned_return_date)
    if diff <= 0, do: 0, else: diff
  end

  def monday?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    Date.day_of_week(date) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planned_date = return_date(checkout_datetime)
    return_datetime = datetime_from_string(return)
    days_late = days_late(planned_date, return_datetime)
    if monday?(return_datetime), do: floor(0.5 * days_late * rate), else: days_late * rate
  end
end
