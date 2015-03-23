var bind_clicks = function(){
  $('#add-myself').on('click', function(e){
    e.preventDefault();
    $.get($(this).attr('href')).success(function(){
      console.log('It worked');
    }).error(function(){
      console.log('It didnt work');
    });
  })
};

$(document).ready(bind_clicks);
$(document).on('page:load', bind_clicks);