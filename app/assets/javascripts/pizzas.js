//$(document).ready(function(){
//    $('#myModal').modal('show');
//});
$('#myModal').on('hidden.bs.modal', function (e) {
    $('#myModal2').modal('show');
})
