module AttachmentHelper

  def self.partition_id(id)
    length = id.to_s.length
    partiion = "0" *  (9 - length)
    partition_id = id.to_s.insert(0, partiion).scan(/.../)
  end

  def self.attachment_url(class_name, attached_file, file_name, partition, style)
    url = "https://buuqit-test.s3.amazonaws.com/#{class_name}/#{attached_file}/#{partition[0]}/#{partition[1]}/#{partition[2]}/#{style}/#{file_name}"
  end

end
