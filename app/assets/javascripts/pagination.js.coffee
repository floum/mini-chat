jQuery ->
  if $('#infinite-scrolling').size() > 0
    $('#comments').on 'scroll', ->
      more_comments_url = $('.pagination .next_page a').attr('href')
      if more_comments_url && $('#comments').scrollTop() > $('#comments').height() - $('#comments').height() - 45
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_comments_url
      return
    return
