class TravelAgent
  def self.checkin(record)
    new(record).checkin
  end

  def initialize(record)
    @record = record
  end

  def checkin
    agent = Mechanize.new

    page = agent.get "http://www.southwest.com"
    review_page = page.form_with(id: 'retrieveItinerary') do |form|
      form.field_with(name: 'confirmationNumber').value = @record.confirmation
      form.field_with(name: 'firstName').value = @record.first_name
      form.field_with(name: 'lastName').value = @record.last_name
    end.submit

    @record.checked_in!
  end
end
