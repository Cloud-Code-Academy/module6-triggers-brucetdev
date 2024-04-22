trigger AccountTrigger on Account (before insert){
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc : Trigger.new) {
            if(String.isBlank(acc.Type)) {
                acc.Type = 'Prospect';
            }
        }
        }
    }