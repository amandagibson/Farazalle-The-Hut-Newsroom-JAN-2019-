# frozen_string_literal: true

When('I fill in the payment form with valid cc credentials') do
  stripe_frame = find("iframe[name='__privateStripeFrame4']")
  within_frame stripe_frame do
    card_field = find_field('cardnumber')
    exp_date_field = find_field('exp-date')
    cvc_field = find_field('cvc')

    4.times { sleep 0.1; card_field.send_keys(right: '4242'); sleep 0.1; }
    exp_date_field.send_keys('1221')
    cvc_field.send_keys('123')
  end
end

Given('I fill in {string} with {string} in the Stripe input field') do |field, value|
  case field
  when 'Cardnumber'
    frame_name = '#card_number div iframe'
    field_name = 'cardnumber'
  when 'Expiry date'
    frame_name = '#exp_date div iframe'
    field_name = 'exp-date'
  when 'CVC'
    frame_name = '#cvc div iframe'
    field_name = 'cvc'
  end

  stripe_frame = find(frame_name)
  within_frame stripe_frame do
    find_field(field_name).send_keys(value)
  end
end

Then('the card got declined with message {string}') do |content|
  expect(page).to have_content content
end
