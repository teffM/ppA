toastr.options = {
    "progressBar": true, "positionClass": "toast-bottom-full-width",
    "timeOut": "4000", "showMethod": "show", "hideMethod": "slideUp"};
function msg(t, m) {
    toastr[t](m);
}
function resetForm(f) {
    f[0].reset();
    var v = f.validate({lang: 'es'});
    v.resetForm();
}