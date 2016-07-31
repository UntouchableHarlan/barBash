Rails.configuration.stripe = {
  :publishable_key => "sk_test_9PWNaHvvBKEu3c9wkTx8gJyg",
  :secret_key      => "pk_test_62HeHVyg9ixt0DZ2WE0UdVZ1"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
