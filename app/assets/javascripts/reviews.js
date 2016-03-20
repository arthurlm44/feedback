$(document).ready(function(){
  $('.tab-link').on('click', function(e){
    e.preventDefault();
    if ($(this).hasClass('tab-my-reviews')) {
      $(this).addClass('active');
      $('.tab-my-meta-reviews').removeClass('active');
      $('#my-reviews').show();
      $('#my-meta-reviews').hide();
    } else {
      $('.tab-my-meta-reviews').addClass('active');
      $('.tab-my-reviews').removeClass('active');
      $('#my-reviews').hide();
      $('#my-meta-reviews').show();
    }
  });
});
