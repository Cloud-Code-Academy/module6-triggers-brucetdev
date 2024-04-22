trigger AccTrigger on Account (before insert) {
    for(Account acc : Trigger.isBefore & trigger.isInsert) {
        if(String.isNotBlank(acc.Phone) && String.isBlank(acc.Website) && String.isBlank(acc.Fax)){
            acc.Rating = 'Hot';
        }
    }
    }