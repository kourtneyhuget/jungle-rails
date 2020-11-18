# Jungle

A mini e-commerce application built with Rails. Added features including login/signup with authentication, valid credentials in order for admin to be able to see the admin/product and admin/category pages, created a admin dashboard to display quantity of current products and categories, ability for admin to create new categories, products that have no inventory properly display a "sold out" icon. Integrated Stripe for testing payment. RSpec and Capybara were used for unit and feature testing.

# Screenshots

![demo of jungle admin functionality](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/JungleAdmin.gif?raw=true)
![demo of jungle main functionality](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/JungleAnimatedGif.gif?raw=true)
![homepage](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/JungleHomepage.png?raw=true)
![cart checkout](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/JungleCart.png?raw=true)
![order confirmation](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/OrderConfirmation.png?raw=true)
![stripe integration](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/StripeIntegration.png?raw=true)
![admin categories](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/AdminCategories.png?raw=true)
![admin dashboard](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/AdminDashboard.png?raw=true)
![admin products](https://github.com/kourtneyhuget/jungle-rails/blob/master/docs/AdminProducts.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
