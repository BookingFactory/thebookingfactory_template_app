class SpecialOffer < Sequel::Model
  many_to_one :hotel
end

SpecialOffer.set_dataset :special_offers
