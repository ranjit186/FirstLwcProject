trigger FindDuplicatecases on Case (after insert) {
    Switch on Trigger.operationType{
        when AFTER_INSERT{
            caseTriggerHandler.findDuplicateCase(trigger.new);
        }
    }
}