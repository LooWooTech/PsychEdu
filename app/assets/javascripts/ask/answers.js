$(document).ready(function() {

  $('#mainarea').delegate('[data-event="answer.edit"]', 'ajax:success', function(e, data) {
    var modal = $(data).buildModal();

    // editor
    modal.find('[data-event="editor"]').editor();
  });

  //vote up
  $('#mainarea').delegate('.media-post-vote .vote-up', 'click', vote_up);

  //vote down
  $('#mainarea').delegate('.media-post-vote .vote-down', 'click', vote_down);

  function vote(up, link) {
    var url = $(link).attr('href');
    var id = $(link).data('answer-id');
    $.post(url, {answer_vote: {up: up, answer_id: id}}, function(data){
      $(link).closest('.media-post-vote').find('strong').text(data);
    }).fail(function(xhr){
      //already voted
    });
  };

  function vote_up() {
    vote(true, this);
    return false;
  };

  function vote_down() {
    vote(false, this);
    return false;
  };

});
