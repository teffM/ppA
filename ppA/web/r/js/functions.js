toastr.options = {
    "progressBar": true, "positionClass": "toast-bottom-full-width",
    "timeOut": "3000", "showMethod": "show", "hideMethod": "slideUp"};
function msg(t, m) {
    toastr[t](m);
}