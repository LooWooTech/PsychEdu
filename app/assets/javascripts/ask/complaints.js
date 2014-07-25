$(document).ready(function() {
  $('#mainarea').delegate('[data-event="complaints"]', 'ajax:success', function(e, data) {
    var modal = $(data).buildModal();

    // publish edited answer
    modal.delegate('[data-event="complaint.publish"]', 'ajax:success', function(e, data) {
      alert(data);
      modal.modal('hide');
    });
  });
});
