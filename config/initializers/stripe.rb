Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISH'],
  :secret_key      => ENV['STRIPE_SECRET']
}

Stripe.api_key = ENV['STRIPE_SECRET']