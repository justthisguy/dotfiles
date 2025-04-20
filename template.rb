puts "++++++++++++++ we are starting"


# Main setup
source_paths
directory "~/.dotfiles/rails/views/pages",  "app/views/pages"
copy_file "~/.dotfiles/rails/pages_controller.rb", "app/controllers/pages_controller.rb"

def git_commit comment
  puts "============== git commit #{comment}!"

  git add: "."
  git commit: %Q{ -m "#{comment}!" }
end


def add_gems
  # Add necessary gems to the Gemfile
  puts "++++++++++++++ gems added"

  ### Auth with Rodauth
  gem "rodauth-rails", "~> 2.0"
  # gem "sequel-activerecord_connection", "~> 2.0" # Enables Sequel to use Active Record's database connection
  # gem "bcrypt", "~> 3.1" # Used by Rodauth for password hashing
  # gem "tilt", "~> 2.4" # Used by Rodauth for rendering built-in view and email templates

  ### Tailwind CSS
  gem "tailwindcss-ruby"
  gem "tailwindcss-rails"


  gem_group :development, :test do
    gem "database_cleaner"
    gem "factory_bot_rails", git: "http://github.com/thoughtbot/factory_bot_rails"
    gem "rspec-rails"

  end

  gem_group :development do
    # gem "fuubar"
    # gem "guard"
    # gem "guard-rspec"
    # gem "rubocop"
    # gem "rubocop-rails", require: false
    # gem "rubocop-rspec"

    # for solargraph
    gem "solargraph"
    gem "standard"
    gem "rubocop"
  end

  gem_group :test do
    gem "simplecov", require: false
  end

  git_commit "gems added"

end

def config_rspec
  # Set up RSpec and related configurations
  puts "*********** start config_rspec"
  generate "rspec:install"
  git_commit "does rspec:install"

  # directory "spec", force: true
  # run "rm -r test" if Dir.exist?("test")
  # copy_file ".rubocop.yml"
  # copy_file ".simplecov"
  # copy_file "Guardfile"

  ## setup SimpleCov -- https://github.com/simplecov-ruby/simplecov
end

def config_rodauth_rails
  # Add rodauth_rails CSS
  puts "*********** start config rodauth-rails"
  generate "rodauth:install"
  git_commit "adds rodauth-rails"
end

def config_tailwind
  # does tailwindcss:install
  puts "*********** start config_tailwind"
  rails_command "tailwindcss:install"
  git_commit "does tailwindcss:install"
end

def config_routes
  route "root to: 'pages#welcome'"
end



# def add_active_storage
#   # Add Active Storage configurations
#   rails_command "active_storage:install"
# end

# def add_devise_users
#   # Add user authentication with Devise
#   generate "devise:install"
#   generate "devise User"
# end

# def add_sidekiq
#   # Set up Sidekiq for background jobs
#   run "bundle exec rails g sidekiq:worker Example"
# end

# def add_foreman
#   # Set up Foreman for process management
#   copy_file "Procfile"
# end

# def copy_templates
#   # Copy custom templates and configurations
#   remove_dir "spec"
#   copy_file "Guardfile"
#   copy_file ".rspec", force: true
#   copy_file ".rubocop.yml"
#   copy_file ".simplecov"
#   directory "config", force: true
#   directory "lib", force: true
#   directory "spec", force: true
# end

# def config_stimulus
#   puts "*********** start config_stimulus"
#   # Add Stimulus for JavaScript
#   rails_command "stimulus:install"
# end

# def add_fontawesome
#   # Add Font Awesome
#   # https://docs.fontawesome.com/web/use-with/ruby-on-rails
# end

puts "++++++++++++++ Main business logic"

### Main business logic


# Git initialization
git :init
git_commit "Initial commit"

add_gems

after_bundle do
  puts "++++++++++++++ after_bundle"
  # stop_spring -- not using spring

  config_routes
  config_rspec
  config_rodauth_rails
  config_tailwind

  # add_active_storage
  # add_users
  # add_sidekiq
  # add_foreman
  # copy_templates
  # add_fontawesome


  ### Database setup
  rails_command "db:create"
  rails_command "db:migrate"

end





# ===============================================================================

#   * Ensure you have defined a root path in your config/routes.rb. For example:

#       root to: "pages#home"

#   * Ensure you're displaying flash messages in your layout template. For example:

#       <% if notice %>
#         <div class="alert alert-success"><%= notice %></div>
#       <% end %>
#       <% if alert %>
#         <div class="alert alert-danger"><%= alert %></div>
#       <% end %>

#   * Titles for Rodauth pages are available via @page_title instance variable
#     by default, you can use it in your layout file:

#       <title><%= @page_title || "Default title" %></title>

#   * You can copy Rodauth views into your app by running:

#       rails g rodauth:views # default bootstrap views

#       rails g rodauth:views --css=tailwind # tailwind views (requires @tailwindcss/forms plugin)

#   * You can copy email templates and generate mailer integration by running:

#       rails g rodauth:mailer

# ===============================================================================
