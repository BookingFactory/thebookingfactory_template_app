class WebsiteQuestion < Sequel::Model
  many_to_one :website_data

  liquid_methods :question, :answer
end

WebsiteQuestion.set_dataset :website_questions
