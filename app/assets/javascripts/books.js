$(document).on('turbolinks:load',() => {
  var details = $("#display");
  var search_button = $("#search_button");
  var search_input = $("#search_input");
  var search_icon = $("#search_button i");
  var invalid_tooltip = $("#isbn_invalid-tooltip");
  search_input.keypress(function(event) {
    var keycode = event.keyCode || event.which;
    if(keycode == '13') {
      search_button.click();    
    }
  });
  search_button.on("click", () => {
    var value = search_input.val();
    var validate_isbn = validateIsbn(value);
    if(validate_isbn.is_valid) {
      invalid_tooltip.hide("slow")
      invalid_tooltip.html("");
      $.ajax({url: "/books/search", 
      data: { isbn: value},
      dataType: "script",
      beforeSend: function() {
        search_icon.removeClass("fa-search").addClass("fa-spinner fa-spin");
        search_input.prop('disabled', true);
        search_button.prop('disabled', true);
      },
      success: function() {
        search_input.prop('disabled', false);
        search_button.prop('disabled', false);
      },
      statusCode: {
        404: function() {
          search_input.prop('disabled', false);
          search_button.prop('disabled', false);
        },
        404: function() {
          search_input.prop('disabled', false);
          search_button.prop('disabled', false);
        }
      }});
    }
    else {
      details.hide("slow", function() {
        details.html("")
      });
      invalid_tooltip.html(validate_isbn.message);
      invalid_tooltip.show("slow")
      search_button.removeClass("btn-info").addClass("btn-danger");
      search_button.find("i").removeClass("fa-spinner fa-spin fa-search").addClass("fa-beat fa-exclamation")
    }
  });
  search_input.on('input', function() {
    this.value = this.value.replace(/[^0-9-Xx]/g, '').replace(/(\..*)\./g, '$1');
  })
  search_input.on('keyup', function(e) {
    if(e.keyCode == 13) return "";
    clearTimeout(250);
    timer = setTimeout(function() {
      search_button.removeClass("btn-danger").addClass("btn-info");
      search_button.find("i").removeClass("fa-beat fa-exclamation").addClass("fa-search")
    }, 250);
  });

  var validateIsbn = (input) => {
    var invalid_message = "Input valid ISBN (10 or 13),EX: 99921-58-10-7, 9780306406157";
    if(input.trim().length >= 10 && input.trim().length <= 17) {
      var output = check_validity(input);
      if(!output) {
        return { is_valid: output, message: invalid_message }
      } else {
        return { is_valid: true, message: invalid_message }
      }
    } else {
      return {is_valid: false,message: invalid_message }
    }
  }
});