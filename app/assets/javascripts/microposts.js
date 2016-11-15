$(document).on('ready page:load', function () {
  var isLoading = false;
  if ($('#infinite-scrolling').size() > 0) {
    $(window).on('scroll', function() {
      var more_micropost_url = $('.pagination a.next_page').attr('href');
      if (!isLoading && more_micropost_url && $(window).scrollTop() > $(document).height() - $(window).height() - 200) {
        isLoading = true;
        $.getScript(more_micropost_url).done(function (data,textStatus,jqxhr) {
          isLoading = false;
        }).fail(function() {
          isLoading = false;
        });
      }
    });
  }
});
