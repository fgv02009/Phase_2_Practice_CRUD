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

//WORKING ON AJAXING EDITING FUNCTIONALITY--Stuck on response functionality- how do I target the particular thing being edited to append response?
  // $(document).on("click", ".editing", function(event) {
  //   event.preventDefault();
  //   var blog_id = $(this).closest("form").eq(0).attr("class")
  //   var request = $.ajax({
  //     url: "/blogs/"+blog_id+"/edit",
  //     type: "GET"
  //     // data: $(this).closest("form").serialize()
  //   });

  //   request.done(function(response) {
  //     $(this).append(response);

  //   });
  // });
});
