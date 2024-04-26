trigger AccountTrigger on Account (before insert, before update){
// code solution to question 1
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc : Trigger.new) {
            if(String.isBlank(acc.Type)) {
                acc.Type = 'Prospect';
            }
        }
    }
    // code solution to question 2
if(trigger.isInsert){
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
}
}