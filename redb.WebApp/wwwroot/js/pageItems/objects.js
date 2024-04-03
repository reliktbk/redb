$(() => {
    $("#ObjectList").dxTreeList({
        dataSource: new DevExpress.data.CustomStore({
            load: function () {
                var d = $.Deferred();
                return $.getJSON('/Controllers/ObjectItems/GetAllObjects')
                    .done(function (result) {
                        d.resolve(result);
                    })
                    .fail(function () {
                        throw 'Data loading error';
                    });
            }
        }),
        columns: [{
            dataField: "id",
            caption: "id"
        },
        {
            dataField: "name",
            caption: "Name"
        },
        {
            dataField: "parentId",
            caption: "Parent"
        }]
    });
});