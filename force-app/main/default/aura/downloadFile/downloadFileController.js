({
    myAction : function(component, event, helper) {
        
    },
    init : function(cmp, event, helper){
        const element = document.createElement('a');
        console.log("element : ---"+ element);
        const text = 'thisisfortutorialhsn jsndl';
        element.setAttribute('href', 'data:text/plain;charset=utf-8,'+encodeURIComponent(text));
        element.setAttribute('download', 'Download.txt');
        element.innerText = 'click it';
        console.log("this console.log", element);
        document.body.appendChild(element);
       element.click();
        document.body.removeChild(element);
    }
})