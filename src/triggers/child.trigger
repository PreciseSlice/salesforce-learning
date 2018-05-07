trigger child on child__c (after insert) {
  
  if (Trigger.isAfter && Trigger.isInsert) {
    emailParents();
    emailChild();
  }

  private String[] parentAddresses() {
    parent__c[] parents = [SELECT email__c FROM parent__c];
    String[] emails = new String[] {};
    for(parent__c parent : parents) {
      emails.add(parent.email__c);
    }

    return emails;
  }

  private String[] childAddresses() {
    child__c[] children = [SELECT email__c FROM child__c];
    String[] emails = new String[] {};
    for(child__c child : children) {
      emails.add(child.email__c);
    }

    return emails;
  }

  //private String[] parentInfo() {
    // get all the parent info remove the SOQL query from the parent_addresses method
  //}

  private String childInfo(Child__c child) {
    return child.Name + ' has ' + child.Hair_Color__c + ' hair and benches ' + child.Bench_Weight__c + ' pounds.';
  } 

  private String parentInfo(Parent__c parent) {
    return parent.Name + ' has ' + parent.Game_System__c + ' Gaming systems and bed time is at' + parent.Bed_Time__c; 
  }

  private void emailParents() {
    String[] parentAddresses = parentAddresses();
    String subject = 'New Children!';
    String body = 'Look at all these kids: \n';

    for(child__c child : Trigger.new) {
      body += childInfo(child) + '\n';
    }

    emailSender.sendEmail(parentAddresses, null, subject, body);
  }

  private void emailChild() {
    // String[] childAddresses = childAddresses();
    // String subject = 'New Parents!';
    // String body = 'Look at these new parents: \n';

    // for(parent__c parent : Trigger.new) {
    //   body += parentInfo(parent) + '\n';
    // }

    // emailSender.sendEmail(childAddresses, null, subject, body);
  }
}

// in console

// Child__c childOne = new Child__c(name='sam', hair_color__c='black', bench_weight__c = 10, email__c = 'slherms+same@gmail.com');
// Child__c childTwo = new Child__c(name='sarah', hair_color__c='brown', bench_weight__c = 25, email__c = 'slherms+sarah@gmail.com');

// insert new child__c[] {
//   childOne, childTwo  
// };
