class InvisiblePhoto < Sequel::Model
  many_to_one :hotel
end

InvisiblePhoto.set_dataset :invisible_photos
