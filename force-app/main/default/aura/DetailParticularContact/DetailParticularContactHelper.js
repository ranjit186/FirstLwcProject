({
    COLUMNS: [
        { label: 'Name', fieldName: 'Name' },
        {
            label: 'Account Name',
            fieldName: 'AccountName',
            //type: 'number',
            //sortable: true,
            cellAttributes: { alignment: 'left' },
        },
        { label: 'Email', fieldName: 'Email', type: 'Email' },
        { label: 'Phone', fieldName: 'Phone', type: 'Phone' },
        { label: 'CreatedDate', fieldName: 'CreatedDate', type: 'Date' },
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
        const contactId = cmp.get("v.contactId");
        console.log("get contactId : "+contactId);
        
        const action = cmp.get("c.getContactDetail");
        console.log("action : "+action)
        
        action.setParams({contId: contactId});
        action.setCallback(this, function(response){
            const returnValue = response.getReturnValue();
            console.log("returnValue  : "+ returnValue);
            console.log("returnValue  : "+ response.getState());
            console.log("returnValue strigify : "+ JSON.stringify(returnValue));
            
            for(var i = 0; i< returnValue.length; i++){
                const tmpValue = returnValue[i];
                if(tmpValue.Account){
                    tmpValue.AccountName = tmpValue.Account.Name;
                }
            }
            cmp.set('v.data', returnValue);
        });
        
        $A.enqueueAction(action);
        
       // cmp.set('v.data', this.DATA);
    },
    
    
    
})