# Jungle

Jungle is a mini E-Commerce application built with Rails 4.2. Customers can browse products and add items to cart. Stripe is used to verify online transactions and place orders. There is also a password protected Admin section for owner to manage their online inventory stocks.

## Tech Stack and Tools
| Front-End  | Back-End | Database | Testing | Other |
| ------------- | ------------- | ------ | ---------- | --------- |
| **Bootstrap** | **Rails 4.2**  | **PostgreSQL** | **Rspec** for model/controller testing | **Stripe**|
| **HTML** |  | | **Capybara + Poltergeist** for feature spec testing | **bcrypt** for password hashing|
| **CSS** with **SASS** as preprocessor | | ||

## Demo

A gif demonstrating a customer adding items to cart and placing an order through Stripe
!["Shopping for products"](https://github.com/xihai01/Jungle/blob/master/docs/jungle.gif?raw=true)

The admin (owner) of Jungle has their own section where they can create/destroy products and categories. They can also see their inventories. Admin's will need to login with a username and password to access this part of the site.
!["Admin products page"](https://github.com/xihai01/Jungle/blob/master/docs/admin.png?raw=true)

Customers can also login/register for their own profiles. All user passwords are hashed first using bcrypt before storing them into the database.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe