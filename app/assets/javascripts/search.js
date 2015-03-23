// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:load ready', function(e){
  bind_typeahead();
  $('#search').focus();
});

$(document).on('typeahead:selected', function(e, res, dataset){
  if (dataset === "user-search") {
    window.location = "/search?user_id=" + res.id;
  } else {
    window.location = "/initiatives/" + res.id
  }
});

var bind_typeahead = function(){
  $('#search').typeahead([{
    name: 'user-search',
    remote: '/autocomplete?model=user&q=%QUERY',
    valueKey: 'full_name',
    header: '<h5>Users</h5>'
  },
  {
    name: 'group-search',
    remote: '/initiatives.json?q=%QUERY',
    valueKey: 'name',
    header: '<h5>Initiatives</h5>'
  }]);
};