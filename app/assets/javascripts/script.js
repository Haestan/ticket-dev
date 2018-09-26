$(document).ready(function(){
    $('fieldset.optional > div:nth-child(3) > label:nth-child(2)').click(function(){
        alert("Le ticket va être clôturé et vous ne pourrez plus le modifier. Êtes-vous sûr ? ")
    })
});