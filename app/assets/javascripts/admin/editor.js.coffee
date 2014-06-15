$ ->
  $('.image-uploader .image-list').on 'click', 'li', (e) ->
    modalBox = $(this).closest('.image-uploader')
    modalBox.find('.selected').removeClass('selected')
    $(this).addClass('selected')
    modalBox.find('input').val($(this).find('img').attr('src'))

  $('.image-uploader [type=file]').fileupload
    url: '/admin/images'
    type: 'post'
    formData: {}
    done: (e, data)->
      url = data.result
      imageList = $(this).closest('.image-uploader').find('.image-list')
      imageList.prepend("<li><img src='#{url}'/></li>")
