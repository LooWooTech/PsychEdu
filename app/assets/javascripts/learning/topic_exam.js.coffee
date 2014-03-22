$ ->
  $('#topic-exam-material-upload').submit ->
    if $(this).find('input[type=file]').val().trim() is ''
      alert '请选择要上传的材料'
      false

  $('#topic-exam-submit').submit ->
    if $('#topic-exam-material-upload input[type=file]').val().trim() isnt '' 
      confirm '您还有材料未上传，是否直接交卷？'
    else
      confirm '是否确实要交卷？'
