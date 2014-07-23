FactoryGirl.define do
  factory :user do
    first_name     "Mili"
    last_name	"Green"
    email    "mili@mydom.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
