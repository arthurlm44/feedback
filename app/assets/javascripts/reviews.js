var swapTabs = function() {
  $('.tab-link').on('click', function(e){
    e.preventDefault();

    $link = $(this);
    $('.tab-link').removeClass('active')
    $link.addClass('active');

    if ($link.hasClass('tab-my-reviews')) {
      $('#my-reviews').show();
      $('#my-meta-reviews').hide();
    } else if ($link.hasClass('tab-my-meta-reviews')) {
      $('.tab-my-meta-reviews').addClass('active');
      $('#my-reviews').hide();
      $('#my-meta-reviews').show();
    }
  });
}
