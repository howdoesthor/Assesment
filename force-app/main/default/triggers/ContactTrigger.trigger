trigger ContactTrigger on contact(after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            ContactTriggerHandler2.updateCountOnParentAccount(Trigger.New, null);
        } else if(Trigger.isUpdate){
                ContactTriggerHandler2.updateCountOnParentAccount(Trigger.New, Trigger.oldMap);
        } else if(Trigger.isDelete){
            ContactTriggerHandler2.updateCountOnParentAccount(Trigger.old, null);
        } else if(Trigger.isUndelete){
            ContactTriggerHandler2.updateCountOnParentAccount(Trigger.new, null);
        }
    }
}