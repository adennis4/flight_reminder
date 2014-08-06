class FlightRecordBuilder
  def self.build(params)
    new(params).build
  end

  def initialize(params)
    @bits = params.slice!('confirmation', 'first_name', 'last_name', 'email')
    @attrs = params
  end

  def build
    @attrs['depart_at'] = build_depart_at
    FlightRecord.new @attrs
  end

  private

  def build_depart_at
    DateTime.strptime @bits.values.join(' '), "%m/%d/%Y %H:%M %z"
  end
end
