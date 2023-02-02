trigger CloseDateVal on Opportunity (before insert) {
    for(Opportunity opp : Trigger.new){
        
        system.debug('date today: '+Date.today());
        if(opp.CloseDate < Date.today() + 1){
            opp.addError('Please enter a future Closed Date');
        }
    }
}