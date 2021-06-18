homeConfig = {
    pageIndex: 1,
    pageSize: 5
};

$.addCommas = function (x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, " ");
    return parts.join(".");
};

var EmployeeController = {
    init: function () {
        EmployeeController.loadData();

        $('input.numbers').keyup(function (event) {

            // Chỉ cho nhập số
            if (event.which >= 37 && event.which <= 40) return;

            // format number
            //$(this).val(function (index, value) {
            //    return value
            //        .replace(/\D/g, "")
            //        .replace(/\B(?=(\d{3})+(?!\d))/g, " ")
            //        ;
            //});

            $(this).val(function (index, value) {
                return $.addCommas(value);
            });
        });


        //function addCommas(x) {
        //    var parts = x.toString().split(".");
        //    parts[0] = parts[0].replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, " ");
        //    return parts.join(".");
        //}

    },
    registerEvent: function () {
        $('#frmSaveData').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 5
                },
                salary: {
                    required: true,
                    //number: true
                }
            },
            messages: {
                name: {
                    required: "Họ tên không được để trống.",
                    minlength: "Chiều dài tối thiểu ít nhất 5 ký tự"
                },
                salary: {
                    required: "Salary không được để trống.",
                    //number: "Bạn phải nhập số."
                }
            }
        });

        $('#btnSearch').off('click').on('click', function () {
            EmployeeController.loadData(true);
        });

        $('#txtNameS').off('keypress').on('keypress', function (e) {
            if (e.which === 13) {
                EmployeeController.loadData(true);
            }
        });

        $('#txtNameS').off('change keydown paste input').on('change keydown paste input', function () {

            EmployeeController.loadData(true);

        });

        $('#ddlStatusS').off('change').on('change', function () {
            EmployeeController.loadData(true);

        });

        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('');
            EmployeeController.loadData(true);
        });

        $('#btnAddNew').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
        });

        $('#btnSave').off('click').on('click', function () {
            if ($('#frmSaveData').valid()) {
                EmployeeController.saveData();
            }
        });


        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            var id = $(this).data('id');
            EmployeeController.loadDetail(id);
        });

        $('.btn-delete').off('click').on('click', function () {
            var id = $(this).data('id');
            bootbox.confirm("Are you sure?", function (response) {
                if (response)
                    EmployeeController.deleteEmployee(id);
            });
        });

    },

    deleteEmployee: function (id) {
        $.ajax({
            url: '/Employees/Delete',
            type: 'DELETE',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (response) {

                if (response.status === true) {
                    bootbox.alert("Delete sucess", function () {
                        EmployeeController.loadData(true);
                    });
                }
                else {
                    bootbox.alert("Delete fail");
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    },

    loadDetail: function (id) {
        $.ajax({
            url: '/Employees/GetDetail',
            type: 'GET',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (response) {
                var data = response.data;
                if (response.status === true) {
                    $('#hidID').val(data.id);
                    $('#txtName').val(data.name);
                    $('#txtSalary').val(data.salary);
                    $('#txtCreatedDate').val(data.createdDate);
                    $('#ckStatus').prop('checked', data.status);
                }
                else {
                    bootbox.alert(response.message);
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    },

    saveData: function () {


        //var formUser = $('#frmSaveData').serializeArray();

        //console.log(formUser);

        //var data1 = JSON.stringify($('#frmSaveData').serialize());
        //console.log(data1);

        //var formData = JSON.parse(JSON.stringify(jQuery('#frmSaveData').serializeArray())); // store json string
        //console.log(FormData);

        //var data = $("#frmSaveData").serialize();
        //data = data.split("&");
        //console.log(data);
        //var obj = {};
        //for (var key in data) {
        //    console.log(data[key]);
        //    obj[data[key].split("=")[0]] = data[key].split("=")[1];
        //}

        //console.log(obj);


        var serializedArr = $("#frmSaveData").serializeArray();

        var properJsonObj = jQFormSerializeArrToJson(serializedArr);

        console.log(properJsonObj);

        var data = properJsonObj.salary.split(" ");

        console.log(data);

        var obj = data.toString();

        var b = obj.split(",");

        var c = b.toString();

        console.log(obj);

        properJsonObj.salary = obj;

        console.log(properJsonObj);

        var name = $('#txtName').val();
        var salary = $('#txtSalary').val();

        //var data = salary.split(" ");
        //var obj = data.toString();

        function jQFormSerializeArrToJson(formSerializeArr) {
            var jsonObj = {};
            jQuery.map(formSerializeArr, function (n, i) {
                jsonObj[n.name] = n.value;
            });

            return jsonObj;
        }

        var status = $('#ckStatus').prop('checked');
        var createdDate = $('#txtCreatedDate').val();
        var id = $('#hidID').val();
        var employee = {
            Name: name,
            Salary: obj,
            Status: status,
            CreatedDate: createdDate,
            Id: id
        };

        $.ajax({
            url: '/Employees/SaveData',
            type: 'POST',
            data: {
                strEmployee: JSON.stringify(properJsonObj)
            },
            dataType: 'json',
            success: function (response) {
                if (response.status === true) {
                    bootbox.alert("Save Success", function () {
                        $('#modalAddUpdate').modal('hide');
                        EmployeeController.loadData(true);
                    });

                }
                else {
                    bootbox.alert(response.message);
                }
            }
        });
    },

    loadData: function (changePageSize) {
        var name = $('#txtNameS').val();
        var status = $('#ddlStatusS').val();

        $.ajax({
            url: '/Employees/LoadData',
            type: 'GET',
            data: {
                name: name,
                status: status,
                page: homeConfig.pageIndex,
                pageSize: homeConfig.pageSize
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            Name: item.name,
                            Salary: item.salary,
                            Status: item.status === true ? "<span class=\"badge badge-success\">Actived</span>" : "<span class=\"badge badge-danger\">Locked</span>"
                        });

                    });

                    $('#tblData').html(html);
                    EmployeeController.paging(response.total, function () {
                        EmployeeController.loadData();
                    }, changePageSize);
                    EmployeeController.registerEvent();
                }
            }
        });
    },

    paging: function (totalRow, callback, changePageSize) {
        var totalPage = Math.ceil(totalRow / homeConfig.pageSize);//lam tron len

        //unbind pagination if it existed or click change size ==> reset
        if (('#pagination a').length === 0 || changePageSize === true) {
            $('#pagination').empty();
            $('#pagination').removeData('twbsPagination');
            $('#pagination').unbind("page");
        }

        $('#pagination').twbsPagination({
            totalPages: totalPage,
            first: "Đầu",
            next: "Tiếp",
            last: "Cuối",
            prev: "trước",
            visiblePages: 10, // tong so trang hien thi , ...12345678910...
            onPageClick: function (event, page) {
                homeConfig.pageIndex = page;//khi chuyen trang thi set lai page index
                setTimeout(callback, 200);
            }
        });
    }
};
EmployeeController.init();