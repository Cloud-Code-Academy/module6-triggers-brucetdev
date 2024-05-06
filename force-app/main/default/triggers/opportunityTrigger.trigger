trigger opportunityTrigger on Opportunity (before insert, before update, after update, before delete) {
 // solution to question 5
    if(Trigger.isUpdate && trigger.isBefore){
        for(Opportunity opp : Trigger.new){
            if(Opp.Amount < 5000) {
                opp.addError('Opportunity amount must be greater than 5000');
            } 
        }
    }
    // solution to question 6 - banking industry logic isn't working
    if(Trigger.isBefore && Trigger.isDelete){
        // This map will hold the Opportunity ID and related Accounts.
        Map<Id,Account> MapOppIDwithAccounts = new map<Id, Account>();
        
        // This map obtains Opportunities where the parent Account industy is banking and where opportunity stage name is closed won.
        Map<Id, Opportunity> MapOpps = new Map<Id,Opportunity>([SELECT Name, ID, AccountID FROM Opportunity WHERE StageName = 'Closed Won' AND Account.Industry = 'Banking']);
        System.debug(MapOpps);
        for(Opportunity opps : Trigger.old ) {  //MapOpps.values()
            opps.addError('Cannot delete closed opportunity for a banking account that is won');
        }
    }

/*
  
         /*
    * Question 7
    * Opportunity Trigger
    * 1 When an opportunity is updated
      2 set the primary contact on the opportunity
      3 to the contact on the same account with the title of 'CEO'.
    * Trigger should only fire on update.
    */
    // solution to question 7 - in progress
    if(Trigger.isBefore && trigger.isUpdate){
    
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : Trigger.new){
            accountIds.add(opp.AccountID);
        }
        List<Contact> conList = new List<Contact>([SELECT Id, Name, Title, AccountId FROM Contact WHERE Title = 'CEO' AND AccountId IN :AccountIds]);
        Map<Id,Contact> ceoMap = new Map<Id,Contact>(); // Key = account ID, value = contact
        for (Contact con : conList){
            ceoMap.put(con.AccountId, con);
        }
        for (Opportunity opp : Trigger.new){
            if (ceoMap.containsKey(opp.AccountId)){
                opp.Primary_Contact__c = ceoMap.get(opp.AccountId).Id;
            }
        }
    }
}