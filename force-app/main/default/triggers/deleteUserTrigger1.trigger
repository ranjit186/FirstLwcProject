trigger deleteUserTrigger1 on Task (before delete) {
    Id profileid=Userinfo.getProfileId();
    system.debug('profileid : '+profileid);
    profile profilname=[select Name from Profile where id=:profileid];
    system.debug(profilname);
    for(Task accountDuplicate:Trigger.old){
        if(profilname.Name == 'System Administrator'){
            accountDuplicate.addError('No Access for Deletion');                                    
        }    
    }
}