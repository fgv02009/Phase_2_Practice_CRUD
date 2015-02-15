$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(document).on("click", "#adding_blog", function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: "/blogs/new",
      type: "GET"
    });

    request.done(function(response) {
      $("#adding_blog").remove();
      $("body").append(response);
    });
  });

  $(document).on("click", "#saving_blog", function(event) {
    event.preventDefault();
    console.log($(this))
    var request = $.ajax({
      url: "/blogs",
      type: "POST",
      data: $(this).closest("form").serialize()
    });

    request.done(function(response) {
      $(".container_blog_add").remove();
      $("ul").append(response);

    });
  });
});
