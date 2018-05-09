public class authorize_net {
	public 	TransactionDetails transaction_details {get; set;}
	private Map <String, String> credentials = credentials();

	public class TransactionDetails {
		public String record_id 	{get; set;}
		public String description {get; set;} 
		public String first_name 	{get; set;} 
		public String last_name 	{get; set;} 
		public String email 			{get; set;} 
		private String amount;
		public Long cc_number 		{get; set;} 
		public String exp_month 	{get; set;} 
		public String exp_year 		{get; set;} 
		public Integer ccv 				{get; set;} 
	}

	public authorize_net () {
		transaction_details = new transactionDetails();
	}

	private Map <String, String> credentials () {
		Map <String, String> info = new Map <String, String> {};
		credentials__mdt record = [SELECT API_Login_ID__c, TRANSACTION_KEY__c FROM credentials__mdt WHERE DeveloperName = 'Authorize' LIMIT 1];
		info.put('login', record.API_Login_ID__c);
		info.put('password', record.TRANSACTION_KEY__c);
		return info;
	}

	public selectOption[] getExp_years() {
		selectOption[] expirationYears= new selectOption[] {};
		
		expirationYears.add(new selectOption('', 'Year'));
		
		for(integer i = 0; i < 10; i++) {
			expirationYears.add( new selectOption(String.valueOf(2018 + i), String.valueOf(2018 + i) ));
		}
		return expirationYears;
	}

	private String endpoint() {
		return 'https://apitest.authorize.net/xml/v1/request.xml';
	}

	public void chargeCard() {
		
	}
}