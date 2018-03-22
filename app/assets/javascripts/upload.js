(function() {
  jQuery(function() {
    return $('#new_photo').fileupload({
      dataType: "script",
      add: function(e, data) {
        var file, types;
        types = /(\.|\/)(gif|jpe?g|png)$/i;
        file = data.files[0];
        
        var file_size = file.size;
        if(file_size>51000000) {
          return alert("File size is greater than 50MB");
        }else {
          if (types.test(file.type) || types.test(file.name)) {
            data.context = $(tmpl("template-upload", file));
            $('#new_photo').append(data.context);
            return data.submit();
          } else {
            return alert(file.name + " is not a gif, jpeg, or png image file");
          }
        }
      },
      progress: function(e, data) {
        var progress;
        if (data.context) {
          progress = parseInt(data.loaded / data.total * 100, 10);
          return data.context.find('.progress').css('width', progress + '%');
        }
      }
    });
  });

}).call(this);