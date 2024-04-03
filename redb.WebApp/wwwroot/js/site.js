$(() => {

    const lu = (aPrefix) => {
        switch (aPrefix) {
            case 'xhtml': return 'http://www.w3.org/1999/xhtml';
            case 'math': return 'http://www.w3.org/1998/Math/MathML';
            case 'svg': return 'http://www.w3.org/2000/svg';
        }
        return '';
    }

    const itemTemplate = (data) => {
        const sidebar_item = $('<div>').addClass('sidebar-item');
        const sidebar_item_svg = $('<div>').addClass('sidebar-item-svg').appendTo(sidebar_item);
        const svg = $(document.createElementNS(lu('svg'), 'svg')).appendTo(sidebar_item_svg);
        $(document.createElementNS(lu('svg'), 'path')).attr('d', data.path).appendTo(svg);
        $('<span>').text(data.name).appendTo(sidebar_item);
        return sidebar_item;
    }

    const switchByName = (e) => {
        $.post("/Controllers/SidebarList/SetSidebarListIndex?itemIndex=" + e.itemIndex);
        let name = e.itemData.name.replace(" ", "_");
        switch (name) {
            case "Objects": location.href = '/pageitems/objects'; break;
            default: location.href = '/index'; break;
        }
    }

    $('#homeList').dxList({
        itemTemplate: itemTemplate,
        items: [
            {
                name: 'Home',
                path: 'M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z'
            }
        ],
        onItemClick: function (e) {
            location.href = '/index';
        }
    });

    $('#generalList').dxList({
        height: '100%',
        itemTemplate: itemTemplate,
        dataSource: new DevExpress.data.CustomStore({
            load: function () {
                var d = $.Deferred();
                return $.getJSON('/Controllers/SidebarList/General')
                    .done(function (result) {
                        d.resolve(result);
                    })
                    .fail(function () {
                        throw 'Data loading error';
                    });
            }
        }),
        selectionMode: 'single',
        onItemClick: switchByName,
        onContentReady: function (e) {
            let index = $("#modal").attr("SidebarListIndex");
            e.component.selectItem(parseInt(index));
        }
    });

    $('#globalList').dxList({
        itemTemplate: itemTemplate,
        dataSource: new DevExpress.data.CustomStore({
            load: function () {
                var d = $.Deferred();
                return $.getJSON('/Controllers/SidebarList/Global_Settings')
                    .done(function (result) {
                        $('body').css('display', 'block');
                        d.resolve(result);
                    })
                    .fail(function () {
                        throw 'Data loading error';
                    });
            }
        })
    });
});

$(document).ready(function () {
    $('#logout').click(function () {
        $('#form-logout').submit();
    });

    if (!Boolean(document.getElementById('isAtGeneralList')))
        $('#modal').removeAttr('SidebarListIndex');
});
