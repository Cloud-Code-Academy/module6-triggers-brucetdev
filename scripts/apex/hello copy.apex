  //Let's manipulate a different field called secondary contact which is a text field
       Map<Id,Opportunity> Map1 = new Map <Id, Opportunity>([SELECT Id, Name, AccountID, Secondary_Contact__c FROM Opportunity WHERE Name LIKE 'Edge%']);
    System.debug('This is a Map: ' + Map1);
    List<Contact> conList = new List<Contact>([SELECT Id, FirstName, LastName, Title, AccountId FROM Contact WHERE Title = 'COO']);
    System.debug('This is a List of contacts with title CEO: ' + conList);
    if(Opportunity.Secondary_Contact__c = null){
        System.debug('This is the current Secondary Contact: ' + Secondary_Contact__c);
   }