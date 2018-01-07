# Data gathered from https://github.com/umpirsky/country-list

require 'json'

DEFAULT_EXPLICIT_LANG = 'en_US'
DATA_PATH = 'country-list-master/data'

explicit_lang = ARGV.first || DEFAULT_EXPLICIT_LANG
languages = Dir.entries(DATA_PATH).drop(2) # drop `..` and `.`
languages.delete(explicit_lang)
results = Hash.new { |h, k| h[k] = [] }

def read_countries_for_lang(lang)
  file_path = File.join(DATA_PATH, lang, 'country.json')
  JSON.parse(File.read(file_path))
end

countries_in_explicit_lang = read_countries_for_lang(explicit_lang)

languages.each do |lang|
  countries = read_countries_for_lang(lang)
  countries.each { |lang_code, country| results[lang_code].push(country) }
end

synonyms = results.map do |lang, countries|
  "#{countries.uniq.join(', ')} => #{countries_in_explicit_lang[lang]}"
end

File.open('countries_synonyms.txt', 'w') do |f|
  synonyms.each { |country| f.puts(country) }
end

puts 'Done'
