#  rails new . --database=postgresql

bundle check
bundle install

rails db:create
rails db:migrate
rails db:seed
rails s -b 0.0.0.0
