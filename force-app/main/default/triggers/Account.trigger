trigger Account on Account (before insert) {
    for(Account acc : Trigger.new) {
        if(String.isBlank(acc.Type)) {
            acc.Type = 'Prospect';
        }
    }
    }