function openProperties(e) {
    let d = $.Deferred();
    $.getJSON('/Cnt/C' + e.type + '/details?id=' + e.id)
        .done(function (result) {
            d.resolve(result);
        })
        .fail(function () {
            throw 'Data loading error';
        });
    $('#propertiesHeaderText').text('Object id = ' + e.id + ' information');
}

