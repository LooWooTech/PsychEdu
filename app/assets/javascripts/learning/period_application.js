$(function() {
  $('form.period-application').submit(function() {
    if ($(this).find('[name=type]').val() === '') {
      alert('请选择申请类型');
      return false;
    }
    if ($(this).find('[name=start_on]').val() === '') {
      alert('请输入开始日期');
      return false;
    }
    if ($(this).find('[name=end_on]').val() === '' && $(this).find('[name=type]').val() !== 'resuming') {
      alert('请选择结束日期');
      return false;
    }
  }).ajaxForm({
    error: function(xhr) {
      return alert(xhr.responseText);
    },
    success: function(msg) {
      alert(msg);
      return location.reload();
    }
  });

  $('select[name=type]').change(function() {
    if ($(this).val() === 'resuming') {
      $(this).closest('form').find('.end').hide();
    } else {
      $(this).closest('form').find('.end').show();
    }
  });
});