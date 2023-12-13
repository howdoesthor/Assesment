public with sharing class ContactTriggerHandler2 {
    public static void updateCountOnParentAccount(List<Contact> newList, Map<Id,Contact> oldMap){
        boolean isUpdate = false;
        //boolean isUpdate = oldMap != null ? true : false; 
        Set<Id> parentAccountIds = new Set<Id>();
        List<Account> accountsToUpdate = new List<Account>();
        /*if(oldMap != null){
            isUpdate = true;
        } else { isUpdate = false;}*/
        for(Contact c : newList){
            if(!isUpdate || (c.AccountId != oldMap.get(c.Id).AccountId)){
                parentAccountIds.add(c.AccountId);
            }
        }
        for(Account parentAccount : [Select Id, Count__c,(Select Id, AccountId from Contacts) from Account where Id IN : parentAccountIds WITH SECURITY_ENFORCED]){
            parentAccount.Count__c = parentAccount.Contacts.size();
            accountsToUpdate.add(parentAccount);
        }
        update accountsToUpdate;
    }
}