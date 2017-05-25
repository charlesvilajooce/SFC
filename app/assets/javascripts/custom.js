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

jQuery(document).on( 'change keyup keydown paste cut click', 'textarea', function (){
    $(this).height(0).height(this.scrollHeight);
}).find( 'textarea' ).change();