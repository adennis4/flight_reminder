class TravelAgent

  def initialize(record)
    mechanize_setup
    @record = record
  end

  def mechanize_setup
    agent = Mechanize.new

    page = agent.get "http://www.southwest.com"
    review_page = page.form_with(id: 'retrieveItinerary') do |form|
      form.field_with(name: 'confirmationNumber').value = 'ABC123'
      form.field_with(name: 'firstName').value = 'Lionel'
      form.field_with(name: 'lastName').value = 'Messi'
    end.submit
  end
end
