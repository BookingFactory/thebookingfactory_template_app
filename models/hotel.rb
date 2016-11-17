class Hotel < Sequel::Model
  one_to_many :website_datas
  one_to_many :invisible_photos
  one_to_many :gallery_photos
  one_to_many :photos
  one_to_one :github_account

  liquid_methods :photos
end

Hotel.set_dataset :hotels
