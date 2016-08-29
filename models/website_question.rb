class WebsiteQuestion < Sequel::Model
  many_to_one :website_data
end

WebsiteQuestion.set_dataset :website_questions
