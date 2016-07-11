if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_QmS3mrEMdN4s0MMLmf81XJK0',
    :secret_key => 'sk_test_nAX9xraQiiPr2TvC9CaoNcJd'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]