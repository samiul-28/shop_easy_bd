# README

## To Run
`docker compose up` will start up the server.

For running any Rails command like `rails c` prepend the command with `docker compose run citcom`

Examples:d
```
docker compose run app_name rails c
```
```
docker compose run app_name bin/rails db:migrate
```

{sudo docker compose run app_name bundle exec rails db:migrate
sudo docker compose run app_name bundle exec rails c}


```
docker compose run app_name bundle
```

## Debugging
- Put the command `debugger` at any desired breakpoint.
- Start the server by `docker compose up`
- Run `docker ps` to see all running container
- Find the container name for `citcom`
- attach to the container `docker attach <container-name>`



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## 🛍️ ShopEasyBD - E-commerce Website in Ruby on Rails

ShopEasyBD is a professional bilingual (English & Bengali) e-commerce website built manually using **Ruby on Rails**, **Bootstrap**, and following best practices.  
It supports **cash on delivery**, **admin panel**, **user authentication**, product catalog, search, pagination and responsive design.

---

## ✨ Features

✅ Product catalog (with categories & subcategories)  
✅ Product details page with images and bilingual description  
✅ Shopping cart & checkout (cash on delivery)  
✅ User authentication (Devise)  
✅ Admin panel to manage products, categories, and orders (with Pundit)  
✅ Order history & details  
✅ Product reviews and ratings  
✅ Search & filter products (Ransack)  
✅ Pagination for product lists (Kaminari)  
✅ Responsive UI built with Bootstrap 5  
✅ English & Bengali language support (Rails I18n)

---

## 🧰 Tech Stack

- Ruby on Rails 7
- PostgreSQL
- Bootstrap 5
- Devise (authentication)
- Pundit (authorization)
- Active Storage (product images)
- Ransack (search)
- Kaminari (pagination)
- Sidekiq (optional for background jobs)

---


