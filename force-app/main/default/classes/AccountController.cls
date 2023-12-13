// AccountController.cls
public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getRecentAccounts() {
        // Query the 10 most recently created accounts
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED ORDER BY CreatedDate DESC LIMIT 10 ];
    }
}
