    // this code is a stripped down version of the question 7 opportunity trigger without the trigger specific code. Just want to get it work manually first!
   
   List<Opportunity> oppList = new List <Opportunity>([SELECT AccountId, Primary_Contact__c FROM Opportunity WHERE Name LIKE 'Edge%']);
    System.debug('This is a List of Edge Opportunities: ' + oppList);
    Id accId = oppList[0].AccountId;
    List<Contact> conList = new List<Contact>([SELECT Id, FirstName, LastName, Title, AccountId FROM Contact WHERE Title = 'CEO' AND AccountId = :accId]);
    System.debug('This is a Contact List of contacts with title CEO: ' + conList);
    if(oppList[0].Primary_Contact__c != null){
      System.debug('This is the current Primary Contact: ' + oppList[0].Primary_Contact__c);
   }

