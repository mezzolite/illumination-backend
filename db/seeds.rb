require 'rest-client'
require 'json'

Word.destroy_all
Idea.destroy_all
Noun.destroy_all
Verb.destroy_all
Adjective.destroy_all

noun_response = RestClient.get("https://wordsapiv1.p.mashape.com/words/light", headers={
    "#{Rails.application.credentials.dig(:words_api_key)}": Rails.application.credentials.dig(:words_api_value)
    })
    
    
all_noun_definitions = JSON.parse(noun_response.body)["results"]
    

all_noun_definitions.each do |definition|
    if definition["synonyms"] && definition["partOfSpeech"] == "noun"
        definition["synonyms"].each do |synonym|
            Noun.create(
                text: synonym
            )
        end
    end
end

verb_response = RestClient.get("https://wordsapiv1.p.mashape.com/words/illuminate", headers={
    "#{Rails.application.credentials.dig(:words_api_key)}": Rails.application.credentials.dig(:words_api_value)
    })
    
    
all_verb_definitions = JSON.parse(verb_response.body)["results"]
    

all_verb_definitions.each do |definition|
    if definition["synonyms"]
        definition["synonyms"].each do |synonym|
            Verb.create(
                text: synonym
            )
        end
    end
end

response = RestClient.get("https://wordsapiv1.p.mashape.com/words/bright", headers={
    "#{Rails.application.credentials.dig(:words_api_key)}": Rails.application.credentials.dig(:words_api_value)
    })
    
    
all_adjective_definitions = JSON.parse(response.body)["results"]
    

all_adjective_definitions.each do |definition|
    if definition["synonyms"] && definition["partOfSpeech"] == "adjective"
        definition["synonyms"].each do |synonym|
            Adjective.create(
                text: synonym
            )
        end
    end
end

