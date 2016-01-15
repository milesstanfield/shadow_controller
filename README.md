# ShadowController

An RSpec helper that makes testing your rails ApplicationController a cool breeze.
<br><br>
Testing your ApplicationController often requires using the AnonymousController and drawing custom routes. This helper does all that for you and prevents you from having to update your AnonymousController whenever you make a change to the ApplicationController.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test do
  gem 'shadow_controller'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shadow_controller


## Usage

Include the ShadowController in your RSpec configure.

```ruby
# spec/spec_helper.rb
RSpec.configure do |config|
  include ShadowController
end
```

Now cast the shadow helper in your spec
```ruby
# spec/controllers/application_controller_spec.rb
require "spec_helper"

describe ApplicationController, type: :controller do
  cast_shadow ApplicationController

  it "..." do
    ...
  end
end

```

## Example

Your ApplicationController
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_somewhere
    redirect_to 'http://www.example.com'
  end
end
```

Your controller spec
```ruby
# spec/controllers/application_controller_spec.rb
require "spec_helper"

describe ApplicationController, type: :controller do
  cast_shadow ApplicationController

  it "#redirect_somewhere" do
    get :redirect_somewhere
    expect(response).to redirect_to 'http://www.example.com'
  end
end

```

Without the ShadowController helper in use above or any other configurations, this test would have failed with the following error

```ruby
1) ApplicationController #redirect_somewhere
     Failure/Error: get :redirect_somewhere

     ActionController::UrlGenerationError:
       No route matches {:action=>"redirect_somewhere", :controller=>"application"}
     # ./spec/controllers/application_controller_spec.rb:8:in `block (2 levels) in <top (required)>'
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/milesstanfield/shadow_controller. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

