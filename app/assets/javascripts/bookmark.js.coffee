jQuery ->

  window.delay = (ms, func) -> setTimeout func, ms

  $('input#search_tags').keyup ->
    prePopulate $(this)

  prePopulate = (parent) -> $.ajax(
    type: 'GET'
    url: '/tags.json?query=' + parent.val()
    success: (result) ->
      displayTags(result)
    dataType: 'json'
  )

  displayTags = (tags) ->
    $('ul#tag_bookmarks').replaceWith('<ul id="tag_bookmarks"></ul>')
    tagList(tags)
    $('ul#tag_bookmarks').hide()
    delay 1000, -> $('ul#tag_bookmarks').slideDown('slow')

  tagList = (tags) ->
    appendTags(tags)
    addLiEvents()

  appendTags = (tags) ->
    for tag in tags
      li = '<li class="tag" id="' + tag['id'] + '" >' + tag['title'] + '</li>'
      $('ul#tag_bookmarks').append(li)

  addLiEvents = ->
    $('li.tag').click ->
      addTag $(this)

  addTag = (element) ->
    $('div#selected_tags').append('<p id="' + element[0]['id'] + '">' + element.html() + '<span class="remove">x</span></p>')
    $('input#bookmark_tag_tokens').val($('input#bookmark_tag_tokens').val() + element.attr('id') + ',')

    $('p > span.remove').click ->
      valueToReplace = $(this).parent()[0]['id'] + ','
      $('input#bookmark_tag_tokens').val($('input#bookmark_tag_tokens').val().replace(valueToReplace, ''))
      $(this).parent().remove()
