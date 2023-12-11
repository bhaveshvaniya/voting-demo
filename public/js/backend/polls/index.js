$(function() {
    var table = $('#ajaxDatatable').DataTable({
        processing: true,
        serverSide: true,
        paging: true,
        lengthChange: true,
        searching: true,
        ordering: true,
        info: true,
        responsive: true,
        autoWidth: true,
        // scrollX: true,
        ajax: {
            url: backend_url + '/polls/list',
            type: "POST",
            data: function(d) {
                //d.name = $('#equipment_name').val();
            }
        },
        sPaginationType: "first_last_numbers",
        order: [
            [1, "desc"]
        ],
        columns: [
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' },
            { data: 'actions', name: 'actions', orderable: false, searchable: false },
        ],
        drawCallback: function(settings) {
            $('[data-toggle="tooltip"]').tooltip();
        }
    });

});
