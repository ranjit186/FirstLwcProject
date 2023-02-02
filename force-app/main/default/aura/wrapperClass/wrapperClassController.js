({
    
    doinit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Account name', fieldName: 'accountName', type: 'text'},
            {label: 'Contact name', fieldName: 'ContactName', type: 'text'},
            {label: 'opportunity Name', fieldName: 'opportunityName', type: 'text'}
            
        ]);
        var setData = {
            opportunityName: "company.companyName",
            accountName : "AccName.Name",
            ContactName : "date.future",
        };
        helper.fetchData(component, event, setData);
        
    },
    handleAfterScriptsLoaded : function(component, event, helper) {
        
        
        jQuery("document").ready(function(){
             $("#hide").click(function(){
                $("#searchInput").toggle();
                 $("#tableId").toggle();
                 console.log("tableI  : " +$("#tableId"));
                console.log("clicked hide button");
            });
            $("#searchInput").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                console.log("value : "+ value);
                // $("#myTable tr").filter(function() {
                //     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                //});
            });
            
        });
    },          
    
})