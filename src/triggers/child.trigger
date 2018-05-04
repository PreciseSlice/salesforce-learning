trigger child on child__c (after insert) {
  
  if (Trigger.isAfter && Trigger.isInsert) {
    emailParents();
    // emailChildren(); built a thing to email the children
    // add two fields onto the parent object to send to the children income, enertainment systems, strictness.
    // contact only the child which was inserted into the database
  }

  private String[] parentAddresses() {
    parent__c[] parents = [SELECT email__c FROM parent__c];
    String[] emails = new String[] {};
    for(parent__c parent : parents) {
      emails.add(parent.email__c);
    }

    return emails;
  }

  //private String[] parentInfo() {
    // get all the parent info remove the SOQL query from the parent_addresses method
  //}

  private String childInfo(Child__c child) {
    return child.Name + ' has ' + child.Hair_Color__c + ' hair and benches ' + child.Bench_Weight__c + ' pounds.';
  } 

  private void emailParents() {
    String[] parentAddresses = parentAddresses();
    String subject = 'New Children';
    String body = 'Look at all these kids: \n';

    for(child__c child : Trigger.new) {
      body += childInfo(child) + '\n';
    }

    emailSender.sendEmail(parentAddresses, null, subject, body);

  }  
}

// in console

// Child__c childOne = new Child__c(name='sam', hair_color__c='black', bench_weight__c = 10, email__c = 'slherms+same@gmail.com');
// Child__c childTwo = new Child__c(name='sarah', hair_color__c='brown', bench_weight__c = 25, email__c = 'slherms+sarah@gmail.com');

// insert new child__c[] {
//   childOne, childTwo  
// };
