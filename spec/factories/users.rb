FactoryBot.define do
  factory :user do
    nickname               {'test'}
    email                  {Faker::Internet.free_email}
    password               {'abc123'}
    password_confirmation  {'abc123'}
    family_name            {'山田'}
    family_name_kana       {'ヤマダ'}
    first_name             {'太郎'}
    first_name_kana        {'タロウ'}
    birthday               {'2000-01-01'}
  end
end
