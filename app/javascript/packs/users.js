$(document).ready(function(){
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    // Watch for a form submission
    $("#form-submit-btn").click(function(event){
        event.preventDefault();
        $('input[type=submit]').prop('disabled', true);
        var error = false;
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
        if(!error){
            //get stripe token
            Stripe.createToken({
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                expYear: expYear
            }, stripeResponseHandler);
        }
        return false;
    });//form submission
    function stripeResponseHandler(status,response){
        // Get a reference to the form
        var f = $('#new_user');
        // // Get thr token from the reponse
        // var token = response.id;
        // // Add the token to the form
        // f.append('<input type="hidden" name="user[stripe_card_token]" value="'+ token + '" />');
        // // Submit the form
        // f.get(0).submit();
        if (response.error) {
            // Show the errors on the form
            f.find('.payment-errors').text(response.error.message);
            $('input[type=submit]').prop('disabled', false);
        } else {
            // response contains id and card, which contains additional card details
            var token = response.id;
            // Insert the token into the form so it gets submitted to the server
            f.append($('<input type="hidden" name="stripe_card_token" />').val(token));
            // f.append('<input type="hidden" name="user[stripe_card_token]" value="'+ token + '" />');
            // and submit
            f.get(0).submit();
        }
    }
});