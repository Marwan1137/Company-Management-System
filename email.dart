class Email {
  String sender;
  String recipient;
  String subject;
  String content;

  Email({
    required this.sender,
    required this.recipient,
    required this.subject,
    required this.content,
  });

  void viewDetails() {
    print('Sender: $sender');
    print('Recipient: $recipient');
    print('Subject: $subject');
    print('Content: $content');
  }
}
