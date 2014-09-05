$(document).ready(function() {
  $('#mainarea').on('ajax:success', '[data-event="complaints"]', function(e, data) {
    var modal = $(data).buildModal();

    // publish edited answer
    modal.find('[data-event="complaint.publish"]').on('ajax:success',  function(e, data) {
      alert(data);
      modal.modal('hide');
    });
  });
});
