public with sharing class kids_inc {
	public Parent__c parent {get ; set;}
	public Child__c child {get ; set;} 
	public Parent__c[] parents;
	public String message {get; private set;}

	public kids_inc() {
		parent = new Parent__c();
		child = new Child__c();	
	}

	public void saveParent() {
		try {
			UPSERT parent;
			message = parent.name + ', Your information has been saved!';
		} catch (Exception error) {
			message = 'Sorry! ' + error.getMessage();
		}
	}

	public parent__c[] getParents() {
		if (parents == null) {
			parents = [SELECT name, bed_time__c FROM parent__c ORDER BY createddate desc LIMIT 10];
		}
		return parents;
	}
}