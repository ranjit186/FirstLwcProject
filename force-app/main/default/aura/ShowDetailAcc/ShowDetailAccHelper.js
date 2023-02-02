({
    COLUMNS: [
        { label: 'Name', fieldName: 'Name', type: 'text',sortable: true},
        {
            label: 'Phone',
            fieldName: 'Phone',
            type: 'number',
            sortable: true,
            cellAttributes: { alignment: 'left' },
        },
        { label: 'Number_of_Contacts__c', fieldName: 'Number_of_Contacts__c', type: 'number',sortable: true },
        { label: 'Number_of_Cases__c', fieldName: 'Number_of_Cases__c', type: 'number', sortable: true },

    ],

    DATA: [
        { id: 1, name: 'Billy Simonns', age: 40, email: 'billy@salesforce.com' },
        { id: 2, name: 'Kelsey Denesik', age: 35, email: 'kelsey@salesforce.com' },
        { id: 3, name: 'Kyle Ruecker', age: 50, email: 'kyle@salesforce.com' },
        {
            id: 4,
            name: 'Krystina Kerluke',
            age: 37,
            email: 'krystina@salesforce.com',
        },
    ],
    
    setColumns: function(cmp) {
        
        
        cmp.set('v.columns', this.COLUMNS);
    },

    setData: function(cmp) {
        const action = cmp.get("c.getAllAccountDetail");
        
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            if(response.getState() == 'SUCCESS'){
                  cmp.set('v.data', returnValue);
                cmp.set('v.allData', returnValue);
            }
            console.log("State : "+ response.getState());
        })
        
        $A.enqueueAction(action);
      
    },

    // Used to sort the 'Age' column
    sortBy: function(field, reverse, primer) {
        var key = primer
            ? function(x) {
                  return primer(x[field]);
              }
            : function(x) {
                  return x[field];
              };

        return function(a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    },

    handleSort: function(cmp, event) {
        var sortedBy = event.getParam('fieldName');
        var sortDirection = event.getParam('sortDirection');
        const data = cmp.get('v.data');

        var cloneData = data.slice(0);
        cloneData.sort((this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1)));
        
        cmp.set('v.data', cloneData);
        cmp.set('v.sortDirection', sortDirection);
        cmp.set('v.sortedBy', sortedBy);
    }
})