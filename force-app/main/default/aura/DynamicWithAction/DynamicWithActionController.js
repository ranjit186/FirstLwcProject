({
    init: function (cmp, event, helper) {
        var rowActions = helper.getRowActions.bind(this, cmp),
            headerActions = [
                {
                    label: 'All',
                    checked: true,
                    name:'all'
                },
                {
                    label: 'True',
                    checked: false,
                    name:'show_True'
                },
                {
                    label: 'False',
                    checked: false,
                    name:'show_False'
                }
            ],
            fetchData = {
                name : 'company.companyName',
                author: 'name.findName',
                published : 'address.state',
                isPublished : {type: 'helpers.randomize', values : [0, 1]},
                published : {type: 'helpers.randomize', values : ["Published", "Unpublished"]}
            };

        cmp.set('v.columns', [
            { label: 'Name', fieldName: 'Name', type: 'text' },
            { label: 'Author', fieldName: 'Email', type: 'text' },
            { label: 'Account', fieldName: 'AccountName', type: 'text' },
            {
                label: 'Status',
                fieldName: 'Active__c',
                type: 'text',
                actions: headerActions
            },
            { type: 'action', typeAttributes: { rowActions: rowActions } }
        ]);

        helper.fetchData(cmp, fetchData, 20);
    },

    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');

        switch (action.name) {
            case 'show_details':
                alert('Showing Details: ' + JSON.stringify(row));
                break;
            case 'publish':
                helper.publishBook(cmp, row);
                break;
            case 'unpublish':
                helper.unpublishBook(cmp, row);
                break;
            case 'delete':
                helper.removeBook(cmp, row);
                break;
        }
    },

    handleHeaderAction: function (cmp, event, helper) {
        var actionName = event.getParam('action').name;
        var colDef = event.getParam('columnDefinition');
        var columns = cmp.get('v.columns');
        var activeFilter = cmp.get('v.activeFilter');

        if (actionName !== 'clipText' && actionName !== 'wrapText' && actionName !== activeFilter) {
            var idx = -1;
            columns.some(function(column, i) {
                if (column.fieldName === colDef.fieldName) {
                    idx = i;
                    return true;
                }
            });

            var actions = columns[idx].actions;
            if (actions) {
                actions.forEach(function (action) {
                    action.checked = action.name === actionName;
                });

                cmp.set('v.activeFilter', actionName);
                helper.updateBooks(cmp);
                cmp.set('v.columns', columns);
            }

        }
    }
});