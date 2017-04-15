jQuery(document).ready(function($){
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});

jQuery(document).ready(function() {
    jQuery('#userindex').DataTable();
} );

jQuery(document).ready(function() {
    jQuery('#eventsindex').DataTable();
} );
