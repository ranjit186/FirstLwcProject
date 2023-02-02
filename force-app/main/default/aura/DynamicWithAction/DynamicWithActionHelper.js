({
    fetchData: function (cmp, fetchData, numberOfRecords) {
        // var dataPromise = this.mockdataLibrary.lightningMockDataFaker(fetchData, numberOfRecords);
        const action = cmp.get("c.fetchAllContact");
        
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            if(response.getState() == 'SUCCESS'){
                // cmp.set('v.data', returnValue);
                for(let i = 0; i < returnValue.length; i++){
                    const tmpValue = returnValue[i];
                    if(tmpValue.Account){
                        tmpValue.AccountName = tmpValue.Account.Name;
                       
                    }
                }
                cmp.set('v.data', returnValue);
                cmp.set('v.rawData', returnValue);
            }
            console.log("State : "+ response.getState());
        });
        
        $A.enqueueAction(action);
        
    },
    getRowIndex: function(rows, row) {
        var rowIndex = -1;
        rows.some(function(current, i) {
            if (current.id === row.id) {
                rowIndex = i;
                return true;
            }
        });
        return rowIndex;
    },
    removeBook: function (cmp, row) {
        var rows = cmp.get('v.rawData');
        var rowIndex = this.getRowIndex(rows, row);
        
        rows.splice(rowIndex, 1);
        this.updateBooks(cmp);
    },
    publishBook: function (cmp, row) {
        var rows = cmp.get('v.rawData');
        var rowIndex = this.getRowIndex(rows, row);
        
        rows[rowIndex].isPublished = true;
        rows[rowIndex].published = 'Published';
        this.updateBooks(cmp);
    },
    unpublishBook: function (cmp, row) {
        var rows = cmp.get('v.rawData');
        var rowIndex = this.getRowIndex(rows, row);
        
        rows[rowIndex].isPublished = false;
        rows[rowIndex].published = 'Unpublished';
        this.updateBooks(cmp);
    },
    updateBooks: function (cmp) {
        var rows = cmp.get('v.rawData');
        var activeFilter = cmp.get('v.activeFilter');
        var filteredRows = rows;
        
        if (activeFilter !== 'all') {
            filteredRows = rows.filter(function (row) {
                return (activeFilter === 'show_True' && row.isPublished) ||
                    (activeFilter === 'show_False' && !row.isPublished);
            });
        }
        
        cmp.set('v.data', filteredRows);
    },
    getRowActions: function (cmp, row, doneCallback) {
        var actions = [{
            'label': 'Show Details',
            'iconName': 'utility:zoomin',
            'name': 'show_details'
        }];
        var deleteAction = {
            'label': 'Delete',
            'iconName': 'utility:delete',
            'name': 'delete'
        };
        
        if (row.isPublished) {
            actions.push({
                'label': 'Unpublish',
                'iconName': 'utility:ban',
                'name': 'unpublish'
            });
            deleteAction.disabled = 'true';
        } else {
            actions.push({
                'label': 'Publish',
                'iconName': 'utility:approval',
                'name': 'publish'
            });
        }
        
        actions.push(deleteAction);
        
        // simulate a trip to the server
        setTimeout($A.getCallback(function () {
            doneCallback(actions);
        }), 200);
    }
});