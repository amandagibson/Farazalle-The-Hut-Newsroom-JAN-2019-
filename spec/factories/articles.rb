# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'MyString' }
    content { 'It is a beautiful day' }
    status { 'free' }
    image { 'https://cdn.pixabay.com/photo/2016/11/29/04/19/beach-1867285__340.jpg' }
    category
  end
end
