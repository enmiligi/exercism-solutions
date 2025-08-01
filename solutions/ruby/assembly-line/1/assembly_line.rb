class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def success_rate
    if @speed <= 4
      1.0
    elsif @speed <= 8
      0.9
    elsif @speed == 9
      0.8
    else
      0.77
    end
  end

  def production_rate_per_hour
    @speed * success_rate * 221
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
