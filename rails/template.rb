##### TODO
#
# add gem rotp -- TOTP
# add gem webauthn -- https://www.youtube.com/watch?v=ZsGphXQ9kfw
# add gem rodauth-omniauth -- is oauth needed?
# * Figaro
# * Add CanCan and/or Rolify
# flash messages when using Turbo < https://railsdesigner.com/flash-in-rails/ >
# cucumber??


########################################
# Functions defined ( called below )
########################################
def git_commit comment
  git add: "."
  git commit: %Q{ -m "#{comment}!" }
  say  "============== git commit #{comment}!\n\n", :cyan
end


def add_gems
  # Add necessary gems to the Gemfile
  puts "++++++++++++++ gems added", :cyan

  ### Auth with Rodauth
  gem "rodauth-rails", "~> 2.0"
  ## for when we add phlex # gem "rodauth_phlex"

  ### design and CSS
  gem "tailwindcss-ruby"
  # gem "tailwindcss-rails" # included by default
  gem "flowbite", "~> 3.1"

  gem_group :development, :test do
    gem "database_cleaner"
    gem "factory_bot_rails"
    gem 'letter_opener_web', '~> 3.0'
    gem "rspec-rails"
  end

  gem_group :development do
    gem "ruby-lsp"
    gem "ruby-lsp-rails"
    gem "ruby-lsp-rspec"
    gem "ruby-lsp-rails-factory-bot"
    gem "ruby-lsp-shoulda-context"

    gem 'faker'

    # for solargraph
    # gem "solargraph"
    # gem "standard"
    # gem "rubocop"
  end

  gem_group :test do
    gem 'shoulda-matchers', '~> 6.0'
    gem "simplecov", require: false
  end

  git_commit "gems added"
end

# Set up RSpec and related configurations
def config_rspec
  generate "rspec:install"
  git_commit "does rspec:install"

  ## setup SimpleCov -- https://github.com/simplecov-ruby/simplecov
end

# Rodauth Rails -- DEPENDS on tailwind so must happen after
def config_rodauth_rails
  generate "rodauth:install users" #  --argon2 for when security is an issue
  generate "rodauth:views --css=tailwind --all"
  insert_into_file "app/misc/rodauth_main.rb", ", :internal_request", after: ":close_account"

  git_commit "adds rodauth-rails"
end


def config_flowbite
  insert_into_file "app/javascript/application.js", "import 'flowbite';\n"
  insert_into_file "config/importmap.rb", "pin 'flowbite', to: 'https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.turbo.min.js'"
  insert_into_file "app/views/layouts/application.html.erb", "  <div class='w-full fixed top-0 left-0 right-0 z-50'>\n    <%= render 'layouts/navbar' %>\n  </div>\n", after: "<body>\n"

  git_commit "does flowbite setup"
end


def config_routes
  route "root to: 'pages#welcome'"

  insert_into_file "config/routes.rb", "  ###\n  # Static pages\n  ###\n", before: "\nend"

  insert_into_file "config/routes.rb", "  get 'welcome' => 'pages#welcome', as: 'welcome'\n"   , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'terms'   => 'pages#terms',   as: 'terms'\n"     , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'privacy' => 'pages#privacy', as: 'privacy'\n"   , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'home'    => 'pages#home',    as: 'home'\n"      , before: "\nend"
  insert_into_file "config/routes.rb", "  get 'contact' => 'pages#contact', as: 'contact_us'\n", before: "\nend"
  insert_into_file "config/routes.rb", "  get 'about'   => 'pages#about',   as: 'about'\n"     , before: "\nend"

  insert_into_file "config/routes.rb", "\n\n  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?\n", before: "\nend"

  git_commit "configures routes"
end


def build_profiles
  generate "scaffold profile name_given:string name_family:string name_others:string nickname:string location:string description:string image:string user:references"
  remove_file "spec/factories/profiles.rb", force: true
  puts "++++++++++++++ build_profiles done", :cyan
end




########################################
# Where the magic happens
########################################


### Git initialization
git :init
git_commit "Initial commit"


say "\n\nLet's build a fresh new Rails app 🦾 \n\n", :cyan


# insert_into_file "README.md", "# Welcome to #{@app_name.capitalize}\n\n"


# Main setup
source_paths
directory "~/.dotfiles/rails/app/",  "app/"
directory "~/.dotfiles/rails/lib/",  "lib/"
directory "~/.dotfiles/rails/spec/", "spec/"

copy_file "~/.dotfiles/rails/README.md", "README.md", force: true
copy_file "~/.dotfiles/rails/Thorfile",  "Thorfile",  force: true
environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'

git_commit "adds my files"


say "\n\n Main business logic \n\n", :cyan

add_gems

after_bundle do
  puts "++++++++++++++ after_bundle"

  config_routes
  config_rspec
  config_flowbite
  config_rodauth_rails
  build_profiles



  # insert_into_file "app/controllers/application_controller.rb", before: "end" do
  #   add_flash_types :success, :warning # native :notice ( use for info ), :alert ( use for error )

  #   private

  #   def current_user
  #     rodauth.rails_account
  #   end
  #   helper_method :current_user

  # end


  inject_into_file("app/models/user.rb",
                   "  has_one :profile\n",
                   before: "end")

  inject_into_file("app/controllers/application_controller.rb",
                   "  add_flash_types :success, :warning # native :notice ( use for info ), :alert ( use for error )\n\n    private\n\n    def current_user\n      rodauth.rails_account\n    end\n    helper_method :current_user\n",
                   before: "end")

  insert_into_file "app/views/layouts/application.html.erb",
                   "      <div><%= render 'layouts/alert'%></div>\n\n",
                   after: /<main [\w=" -]+>\n/

  ### Database setup
  rails_command "db:drop" # just in case
  rails_command "db:create"
  rails_command "db:migrate"

  rails_command "user:create_first"
  # rails_command "profile:create"

  git_commit "Final from Template"

  say "\n\n🤟 🤙 Rock on 🤘 \n\n", :cyan

end

########################################
# ALL DONE!!
########################################




# ===============================================================================
# #   * Titles for Rodauth pages are available via @page_title instance variable
# #     by default, you can use it in your layout file:
# #       <title><%= @page_title || "Default title" %></title>
#   * You can copy email templates and generate mailer integration by running:
#       rails g rodauth:mailer
# ===============================================================================

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

# def config_user
# +* given name
# +* other names
# +* family name
# +* taken name ( nickname )
# +* username
# +* account
# +* has_many services
# +* has_many address
  # git_commit "configures User"
# end

# def add_fontawesome
#   # Add Font Awesome
#   # https://docs.fontawesome.com/web/use-with/ruby-on-rails
# end


# def edit_files # not using yet
#   in_root do
#     migration = Dir.glob("db/migrate/*").max_by { |f| File.mtime(f) }
#     gsub_file migration, /:admin/, ":admin, default: false"
#   end

#   inject_into_file("app/models/user.rb", "omniauthable, :", after: "devise :")
# end


# def add_users
#   route "root to: 'home#index'"
#   # generate "devise:install"

#   generate :devise, "User", "first_name", "last_name", "announcements_last_read_at:datetime", "admin:boolean"

#   # Set admin default to false
#   in_root do
#     migration = Dir.glob("db/migrate/*").max_by { |f| File.mtime(f) }
#     gsub_file migration, /:admin/, ":admin, default: false"
#   end

#   gsub_file "config/initializers/devise.rb", /  # config.secret_key = .+/, "  config.secret_key = Rails.application.credentials.secret_key_base"

#   inject_into_file("app/models/user.rb", "omniauthable, :", after: "devise :")
# end
