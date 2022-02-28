# Store Agenda

> Store Agenda API.


## Built With

- Ruby 3.0.1
    - Rails 6.1.4.6

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Git
- Ruby (2.7.4+)
- Rails (6+)
- Node

### Setup

- Run `git clone https://github.com/JuliCarracedo/Store-Agenda.git`
- Open the new folder in a code editor
- On the integrated console run `bundle install` to install all gems
- Run `rails db:create db:migrate db:seed` to create the database, the Item table and populate it with items.
- Run `rails s` to launch the Rails server. 
- Optionally, you can run `rails c` to handle the Rails application from inside with IRB

### API documentation

> Every endpoint of this application is under the '/api' namespace

#### GET /api/items

- auth_token: none
- body: none

This endpoint will return an array with all item objects in the database

-response: `[{"id":2,"code":"TSHIRT","name":"Reedsy T-Shirt","price":"€15.00"},{"id":3,"code":"HOODIE","name":"Reedsy Hoodie","price":"€20.00"},{"id":1,"code":"MUG","name":"Reedsy Mug","price":"€6.00"}]`

#### PATCH /api/items/:id

- auth_token: none
- body: `{price: integer}`

This endpoint will update the price for an item.
It requires to add the item id directly to the browse parameters, and requires a price parameter in the body that must be a positive integer. Price must be expressed in cents and then parsed to euros whenever it is returned from the API.

-response to negative price: `Price must be expressed in cents and without symbols`
-response to non-integer price: `Price must be expressed in cents and without symbols`
-response to good request (price: 6000): `MUG updated to €60.00`

#### GET /api/cart

- auth_token: none
- body: `{cart: [Array of valid Item codes], discounts: [Array of valid discount codes]}`

> Discounts is an optional parameter

This endpoint will return a total price for an array of valid codes for users, and calculates discounts if any valid discount codes are given

-response to at least one invalid code: `{"error":"One or many codes are invalid"}`
-response to good request: `{"cart":[Original Array],"total":"€xx.xx"}`
### Run tests

- Run `rspec` to run Rspec test suite
    - Unit test for Item model available

## Author

👤 **Julian Carracedo**

- GitHub: [@JuliCarracedo](https://github.com/JuliCarracedo)
- Twitter: [@CarracedoTrigo](https://twitter.com/CarracedoTrigo)
- LinkedIn: [Julian Carracedo](https://linkedin.com/in/julian-carracedo)
