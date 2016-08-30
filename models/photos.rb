class Photo < Sequel::Model
  many_to_one :hotel

  def photo_original_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'original'
  end

  def photo_public_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'public'
  end

  def photo_big_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'big'
  end

  def photo_medium_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'medium'
  end

  def photo_thumb_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'thumb'
  end

  def photo_public_small_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'public_small'
  end

  def photo_public_big_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'public_big'
  end

  def photo_small_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'small'
  end

  def photo_booking_page_url
    partition = AttachmentHelper.partition_id self.id
    url = AttachmentHelper.attachment_url self.class.table_name, 'photos', self.photo_file_name, partition, 'booking_page'
  end

  liquid_methods :photo_original_url, :photo_public_url, :photo_big_url, :photo_medium_url, :photo_thumb_url,
                 :photo_public_small_url, :photo_public_big_url, :photo_small_url, :photo_booking_page_url
end

Photo.set_dataset :photos
