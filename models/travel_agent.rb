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

    review_form = review_page.form_with(id: 'checkinOptions')
    button = review_form.button_with(value: "Check In")
    confirmation_page = agent.submit(review_form, button)

    boarding_group = confirmation_page.at('.boardingInfo').text
    boarding_number = confirmation_page.at('.boarding_position').text

    boarding_info = boarding_group + boarding_number

    confirmation_form = confirmation_page.form_with(id: 'mobileBoardingPassOptionsForm')

    confirmation_form.checkbox_with(name: 'optionEmail').check
    confirmation_form.field_with(name: 'emailAddress').value = @record.email
    confirmation_form.submit

    @record.checked_in!
  end
end
