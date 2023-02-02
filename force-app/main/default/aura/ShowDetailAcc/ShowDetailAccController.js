({
	   init: function(cmp, event, helper) {
        helper.setColumns(cmp);
        helper.setData(cmp);
    },

    handleSort: function(cmp, event, helper) {
        helper.handleSort(cmp, event);
    },
    handleKeyUp: function (cmp, evt) {
        console.log('called handleKeyUp');
        var isEnterKey = evt.keyCode === 13;
        var queryTerm = cmp.find('enter-search').get('v.value').toUpperCase();
        if (isEnterKey || !isEnterKey) {
            console.log('called handleKeyUp search');
            cmp.set('v.issearching', true);
          
            const allrecords = cmp.get("v.allData");
            
            const tempArray = [];
            
            for(let i = 0; i < allrecords.length; i++){
                if(allrecords[i].Name && allrecords[i].Name.toUpperCase().indexOf(queryTerm) != -1){
                    tempArray.push(allrecords[i]);
                }
            }
            //const searchFilter = evt.getSource().get("v.value").
            console.log("tempArray : "+tempArray);
            cmp.set('v.data', tempArray);
            cmp.set('v.issearching', false);
        }
    },
   /* handleRowAction: function (cmp, event, helper) {
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
    */
})