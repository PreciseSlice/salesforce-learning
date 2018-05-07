trigger parent on parent__c (after insert) {

  if (Trigger.isAfter && Trigger.isInsert) {
    emailChildren();
  }

  private String[] childAddresses() {
    child__c[] children = [SELECT email__c FROM child__c];
    String[] emails = new String[] {};
    for(child__c child : children) {
      emails.add(child.email__c);
    }

    return emails;
  }

  private String parentInfo(Parent__c parent) {
    return parent.Name + ' has ' + parent.Game_System__c + ' Gaming systems and bed time is at' + parent.Bed_Time__c; 
  }

  private void emailChildren() {
    String[] childAddresses = childAddresses();
    String subject = 'New Parents!';
    String body = 'Look at these new parents: \n';

    for(parent__c parent : Trigger.new) {
      body += parentInfo(parent) + '\n';
    }

    emailSender.sendEmail(childAddresses, null, subject, body);
  }
  
}
