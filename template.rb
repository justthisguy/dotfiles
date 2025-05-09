puts "++++++++++++++ template is starting"

# --skip-bundle


# Main setup
source_paths
directory "~/.dotfiles/rails/app/",  "app/"
directory "~/.dotfiles/rails/lib/",  "lib/"
directory "~/.dotfiles/rails/spec/",  "spec/"
environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

# copy_file "~/.dotfiles/rails/pages_controller.rb", "app/controllers/pages_controller.rb"

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

  ## for when we add phlex # gem "rodauth_phlex"

  ### design and CSS
  gem "tailwindcss-ruby"
  # gem "tailwindcss-rails" # included by default
  gem "flowbite", "~> 3.1"

  gem_group :development, :test do
    gem "database_cleaner"
    gem "factory_bot_rails"
    gem "rspec-rails"
  end

  gem_group :development do
    # gem "fuubar"
    # gem "guard"
    # gem "guard-rspec"
    # gem "rubocop"
    # gem "rubocop-rails", require: false
    # gem "rubocop-rspec"

    gem "ruby-lsp-rails-factory-bot"

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

# Set up RSpec and related configurations
def config_rspec
  puts "*********** start config_rspec"
  generate "rspec:install"

  git_commit "does rspec:install"

  # directory "config", force: true
  # directory "spec", force: true
  # run "rm -r test" if Dir.exist?("test")
  # copy_file ".rubocop.yml"
  # copy_file ".simplecov"
  # copy_file "Guardfile"

  ## setup SimpleCov -- https://github.com/simplecov-ruby/simplecov
end

# Rodauth Rails -- DEPENDS on tailwind so must happen after
def config_rodauth_rails
  # Add rodauth_rails CSS
  puts "*********** start config rodauth-rails"
  generate "rodauth:install users" #  --argon2 for when security is an issue

  generate "rodauth:views --css=tailwind --all"
  insert_into_file "app/misc/rodauth_main.rb", ", :internal_request", after: ":close_account"



  git_commit "adds rodauth-rails"
end

def config_tailwind
  puts "*********** start config_tailwind"
  rails_command "tailwindcss:install"
  git_commit "does tailwindcss:install"
end


def config_flowbite
  puts "*********** start config_flowbite"

  # copy_file "~/.dotfiles/rails/views/layouts/_navbar.html.erb", "app/views/layouts/_navbar.html.erb"

  insert_into_file "app/javascript/application.js", "import 'flowbite';\n"
  insert_into_file "config/importmap.rb", "pin 'flowbite', to: 'https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.turbo.min.js'"
  insert_into_file "app/views/layouts/application.html.erb", "  <div class='w-full fixed top-0 left-0 right-0 z-50'>\n    <%= render 'layouts/navbar' %>\n  </div>\n", after: "<body>\n"

  git_commit "does flowbite setup"
end


def config_routes
  route "root to: 'pages#welcome'"

  insert_into_file "config/routes.rb", "  ###\n  # Static pages\n  ###\n", before: "\nend"
  insert_into_file "config/routes.rb", "  get 'about'   => 'pages#about',   as: 'about'\n"     , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'contact' => 'pages#contact', as: 'contact_us'\n", before: "\nend"
  insert_into_file "config/routes.rb", "  get 'home'    => 'pages#home',    as: 'home'\n"      , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'terms'   => 'pages#terms',   as: 'terms'\n"     , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'privacy' => 'pages#privacy', as: 'privacy'\n"   , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'welcome' => 'pages#welcome', as: 'welcome'\n"   , before: "\nend"
end

################################

def edit_files
  in_root do
    migration = Dir.glob("db/migrate/*").max_by { |f| File.mtime(f) }
    gsub_file migration, /:admin/, ":admin, default: false"
  end

  inject_into_file("app/models/user.rb", "omniauthable, :", after: "devise :")
end


def add_users
  route "root to: 'home#index'"
  # generate "devise:install"

  generate :devise, "User", "first_name", "last_name", "announcements_last_read_at:datetime", "admin:boolean"

  # Set admin default to false
  in_root do
    migration = Dir.glob("db/migrate/*").max_by { |f| File.mtime(f) }
    gsub_file migration, /:admin/, ":admin, default: false"
  end

  gsub_file "config/initializers/devise.rb", /  # config.secret_key = .+/, "  config.secret_key = Rails.application.credentials.secret_key_base"

  inject_into_file("app/models/user.rb", "omniauthable, :", after: "devise :")
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

  rails_command "turbo:install"
  rails_command "stimulus:install"

  config_routes
  config_rspec
  # config_tailwind
  config_flowbite

  # rodauth installation depends on tailwind
  config_rodauth_rails

  # add_active_storage
  # add_users
  # add_sidekiq
  # add_foreman
  # copy_templates
  # add_fontawesome



  inject_into_file("app/controllers/application_controller.rb",
                   "  add_flash_types :success, :warning # native :notice ( use for info ), :alert ( use for error )\n",
                   before: "end")

  insert_into_file "app/views/layouts/application.html.erb",
                   "      <div><%= render 'layouts/alert'%></div>\n\n",
                   after: /<main [\w=" -]+>\n/

  ### Database setup
  rails_command "db:drop" # just in case
  rails_command "db:create"
  rails_command "db:migrate"

  rails_command "user:create_first"

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
