trigger AccountTrigger on Account (before insert, after insert, before update){
// code solution to question 1
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc : Trigger.new) {
            if(String.isBlank(acc.Type)) {
                acc.Type = 'Prospect';
            }
        }
        // code solution to question 2

        for (Account acc : trigger.new){
    
        // the first field is the source, the second field 
        // is the destination that receives a copy of the source

        acc.BillingStreet =  acc.ShippingStreet;
        acc.BillingStreet = acc.ShippingStreet;
        acc.BillingState = acc.ShippingState;
        acc.BillingPostalCode =acc.ShippingPostalCode;
        acc.BillingCountry = acc.ShippingCountry;
        acc.BillingCity = acc.ShippingCity;
        }

        //code solution to question 3

        for (Account acc : trigger.new){
            if(String.isNotBlank(acc.Phone) && (String.isNotBlank(acc.Website)) && (String.isNotBlank(acc.Fax))) {
                acc.Rating = 'Hot';
            }
        }
    }

//code solution to question 4
    
 if(trigger.isInsert && trigger.isAfter){
    List<Contact> contactsToCreate = new List<Contact>();
    for (Account acc : trigger.new){
        Contact con = new Contact();
        con.LastName = 'DefaultContact';
        con.Email = 'default@email.com';
        con.AccountId = acc.id;
        contactsToCreate.add(con);
        System.debug(con);
        }
        insert contactsToCreate;
    }
 }