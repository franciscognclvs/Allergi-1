const algoliasearch = require("algoliasearch");
var client = algoliasearch(ENV['ALGOLIA_APPLICATION_ID'], ENV['ALGOLIA_SEARCH_ONLY_API_KEY']);
var index = client.initIndex('medicine');
const input = document.getElementById("search")
console.log(input)
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });