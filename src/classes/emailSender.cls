public class emailSender {

	public void sendEmail(String[] toAddresses, String[] ccAddresses, String subject, String body) {
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setToAddresses(toAddresses);
		mail.setCcAddresses(ccAddresses);

		mail.setSubject(subject);
		mail.setPlainTextBody(body);
		mail.setHtmlBody('<h1>This is an HTML Message. Here is the body: </h1>' + body);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	}

}

// String[] to = new String[]{'slherms@gmail.com'};
// String sub = 'This is my first test email';
// String body = 'This is the body of the friggin email';

// emailSender sender = new EmailSender();
// sender.sendEmail(to, null, sub, body);