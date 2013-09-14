FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    username    "micheal"
    password "foobar"
    password_confirmation "foobar"
  end
end