
# SolrCountriesSynonyms

This repo contains the synonyms file with all countries in all languages for analyzers that accept Solr format. It can be used to configure a synonym token filter for explicit tokenization of country names in various languages to country names in English.

![example](https://user-images.githubusercontent.com/854386/34650177-8afcb928-f3cd-11e7-8511-8bf00779d7b0.png)


Countries data has been gathered from [country-list](https://github.com/umpirsky/country-list).

## Usage

If you use ElasticSearch, you can define a synonym token filter like this:

```JSON
"filter" : {
  "countries_synonyms" : {
    "type" : "synonym",
    "synonyms_path" : "countries_synonyms.txt"
  }
}
```
Then use `countries_synonyms` in any custom analyzer. You can find more information about [Synonym Token Filter](https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-synonym-tokenfilter.html#analysis-synonym-tokenfilter) in the documentation.

## Tokenization to other languages

In case if you need other explicit languages beside English you can generate a synonyms file yourself:

Download countries data
```bash
wget https://github.com/umpirsky/country-list/archive/master.zip
```
Extract it
```bash
unzip -e master.zip
```
Check all available languages
```bash
ls country-list-master/data
```
Run generator with a language option. Here is the example for Russian language
```bash
ruby main.rb ru_RU
```
