FactoryBot.define do
  factory :order_shipping do
    post_code        {'123-1234'}
    prefecture_id    {'2'}
    city             {'いわき市'}
    address          {'青山1-1'}
    building_name    {'青山ビル'}
    phone_number     {'09012341234'}
    token            {"tok_abcdefghijk0000000000000"}
  end
end
