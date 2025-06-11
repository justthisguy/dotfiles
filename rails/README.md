-m ~/.dotfiles/rails/template.rb


Thank you for joining me on this magic carpet ride. This is not AI. It is actual Human Intelligence of Ken, he’s @justthisguy.

# 41 monkeys template

## Core Features

- Rails current version
- Ruby  current version
- Postgres
- Propshaft
- RSpec not test unit
- Hotwire not react


## Featured improvments

- rodauth, rodauth-rails
  - uses 'User' for the main model
- bootstrap, tabler, tabler based navbar
- rspec setup and config
- factorybot along with faker
- thor setup and tasks


# To Dos
  □ move into its own repository
  □ Redirect to original page after creating an account
    * < https://github.com/janko/rodauth-rails/discussions/300 >
    * < https://rodauth.jeremyevans.net/rdoc/files/doc/guides/login_return_rdoc.html >
  □ Testing helpers for Rodauth in Rails < https://github.com/janko/rodauth-rails/discussions/351 >

  □ contact us form
  □ feedback form
  □ settings page

  □ fix dark mode to be consistant with users system default
  □ fix dark mode to be remembered
  □ fix the design, location, and wording for the dark mode toggle

  □ admin gem ( see below )
  □ auth gems ( see below )
  □ Try Log Bench < https://github.com/silva96/log_bench >

  ■ done


# additions for later


### Admin Gem Overview
#### Administrate
Seems to be the right choice.

### Authorization Gem Overview
  □ add Admin user type for rodauth

#### Pundit
Uses plain Ruby policy classes for each model, making it modular and easy to test.
Best for applications with many domain objects or when you want clear, explicit authorization logic per resource.
Policies are stored in app/policies, and you call authorize @object in controllers.
Highly scalable and maintainable in large codebases

#### CanCanCan
Uses a centralized Ability class to define all user permissions using a DSL.
Ideal for smaller apps or when you want all authorization logic in one place.
Especially strong for role-based access control (RBAC) and when permissions are not highly resource-specific.
Easy to set up and use, but can become harder to manage as the number of rules grows

#### Rolify
Not a complete authorization solution, but a popular gem for managing user roles. Often used alongside Pundit or CanCanCan for more advanced role management

#### Recommendation
For most Rails applications, especially those with many models or complex, resource-specific permissions, Pundit is the best choice. It’s modular, explicit, and scales well as your app grows.
For simpler apps or when you want a quick, centralized way to manage permissions, CanCanCan is a strong alternative, especially if you prefer a DSL and are implementing classic RBAC.
Both gems are actively maintained and have excellent documentation and community support

#### Summary
Best overall: Pundit (modular, scalable, explicit)
Best for simple/centralized rules: CanCanCan (easy, RBAC-friendly)
For role management: Rolify (use with Pundit or CanCanCan as needed)
Choose the gem that best fits your application's structure and your team's preferred coding style.
