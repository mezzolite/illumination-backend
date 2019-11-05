require 'rest-client'
require 'json'

Word.destroy_all
Idea.destroy_all

response = RestClient.get("https://wordsapiv1.p.mashape.com/words/light", headers={
    "#{Rails.application.credentials.dig(:words_api_key)}": Rails.application.credentials.dig(:words_api_value)
    })
    
    
all_definitions = JSON.parse(response.body)["results"]
    

all_definitions.each do |definition|
    if definition["synonyms"]
        definition["synonyms"].each do |synonym|
            Word.create(
                text: synonym
            )
        end
    end
end