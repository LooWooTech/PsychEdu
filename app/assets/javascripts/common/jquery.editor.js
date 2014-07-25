//*= require ckeditor/override
//*= require ckeditor/ckeditor

(function() {

  "use strict";

  var config = {
    toolbar: [
      [
        'Format',
        'Bold',
        'Italic',
        '-',
        'Table',
        'NumberedList',
        'BulletedList',
        'Blockquote',
        '-',
        'Link',
        'Unlink',
        '-',
        'Maximize'
      ]
    ],
    format_tags: 'h2;h3;p'
  };

  var Editor = function(el, opts) {

    config = $.extend(config, opts);

    CKEDITOR.replace(el, config);
  }

  $.fn.editor = function(opts) {
    this.each(function() {
      var editor = new Editor(this, opts);
    });
  }

})();
