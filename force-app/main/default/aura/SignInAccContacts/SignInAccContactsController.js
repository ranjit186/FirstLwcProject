({
    showContactRelatedAccount : function(component, event, helper) {
        
        
        helper.fetchdata(component, event);
    },
    
    
    doInit :  function(cmp,  event, helper){
         var row = event.getParam('row');
        const actions = [
            { label: 'Show details', name: 'show_details' },
            { label: 'Delete', name: 'delete' },
           
        ];
        
        cmp.set('v.columns', [
            {label: 'Full Name', fieldName: 'Name', type: 'text'},
            {label: 'First Name', fieldName: 'FirstName', type: 'text',editable: true, typeAttributes: { required: true }},
            {label: 'Last Name', fieldName: 'LastName', type: 'text', editable: true, typeAttributes: { required: true }},
            {label: 'Account Name', fieldName: 'AccountName', type: 'text'},
            {label: 'MailingAddress', fieldName: 'MailingAddress', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'Email', editable: true, typeAttributes: { required: true }},
            {label: 'CreatedDate', fieldName: 'CreatedDate', type: 'Date'},
            { type: 'action', typeAttributes: { rowActions: actions } }
        ]);
        helper.fetchdata(cmp, event);
    },
    handleRowAction: function (cmp, event, helper) {
        var action = event.getParam('action');
        var row = event.getParam('row');
        
        switch (action.name) {
            case 'show_details':
                alert('Showing Details: ' + JSON.stringify(row));
                //console.
                break;
            case 'delete':
                helper.removeBook(cmp, row);
                break;
        }
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        helper.saveEdition(cmp, draftValues);
    },
    addRowsToEnd: function (cmp, event, helper) {
        const getAllData = cmp.get("v.userData");
        
        getAllData.push({
            Name:'',
            FirstName:'',
            LastName:'',
            AccountName:'',
            MailingAddress:'',
            Email:'',
            CreatedDate:''
        });
        
       cmp.set("v.userData", getAllData) ;
    },
    
})