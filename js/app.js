$(document).ready(function() {
    // Helper function to transition pages
    var transitionPage = function(toPage) {
        // Update the nav bar
        $(".nav-page").each( function(index) {
            if ( $(this).children("a").first().attr("href") == toPage ) {
                $(this).addClass("active");
            }
            else {
                $(this).removeClass("active");
            }
        });
        // Update the content
        $.ajax({ url: "views/" + toPage + ".html", dataType: "html"} )
            .done(function(data) { 
                var page = $("#page");
                page.fadeOut(150, function() {
                    page.html(data);
                    page.fadeIn(150);
                });
            });
    };

    // Assign handler for nav button click
    $(".nav-page").on("click", function(event) {
        // Prevent default
        event.preventDefault();
        // Figure out which view has been clicked
        var toPage = $(event.target).attr("href");
        // Transition
        transitionPage(toPage);
    });

    // Load the home view initially
    transitionPage("resources");
});