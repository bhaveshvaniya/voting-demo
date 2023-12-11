$(function() {
    $('#editForm').validate({
        rules: {
            polls_name: {
                required: true
            },
            start_date: {
                required: true
            },
        },
        messages: {
            polls_name: {
                required: "Please Polls title"
            },
            start_date: {
                required: "Please polls start date"
            },

            errorElement: 'span',
            errorPlacement: function(error, element) {
                error.addClass('invalid-feedback');
                // element.closest('.form-group').append(error);
                element.parent().append(error);
            },
            highlight: function(element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            },
            submitHandler: function(form) {
                form.submit();
            }
        }
    });

    //Date picker
    $('#start_date').datetimepicker({
        format: 'DD/MM/YYYY',
        ignoreReadOnly: true

    });

    $('#end_date').datetimepicker({
        format: 'DD/MM/YYYY',
        ignoreReadOnly: true
    });

    //Timepicker
    $('#timepicker').datetimepicker({
        format: 'LT'
      })

      //Timepicker
    $('#endtimepicker').datetimepicker({
        format: 'LT'
      })


      $(document).ready(function () {
        //var counter = 0;

        $("#addrow").on("click", function () {
            var newRow = $("<tr>");
            var cols = "";

            cols += '<td><input type="text" class="form-control" name="options[][content]"/></td>';
            cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
            newRow.append(cols);
            $("table.order-list").append(newRow);

        });



        $("table.order-list").on("click", ".ibtnDel", function (event) {
            $(this).closest("tr").remove();
            //counter -= 1
        });


    });



    function calculateRow(row) {
        var price = +row.find('input[name^="price"]').val();

    }

    function calculateGrandTotal() {
        var grandTotal = 0;
        $("table.order-list").find('input[name^="price"]').each(function () {
            grandTotal += +$(this).val();
        });
        $("#grandtotal").text(grandTotal.toFixed(2));
    }





});
