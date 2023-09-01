// Sending automatic response email to respondents
function sendAutoResponse(e) {
  var userEmail = e.response.getRespondentEmail();
  var subject = "Thank you for your application!";
  var message = "Dear Applicant,\n\nThank you for submitting your application. We appreciate your interest in Crack The Code CTF 2023.\n\nTo get more information about the event, please kindly check the facebook page: https://www.facebook.com/CrackTheCodeCTF\n\nBest regards,\nSouksomphone Phimmasone"; // Email body to be changed depending on your context

  MailApp.sendEmail(userEmail, subject, message);
}

// Closing the form automatically when the respondents exceeded
function closeForm(){
  var form = FormApp.openById('1auDm4hURatt-WFKWHFGNtz8wGTxmkdAvMbaeABnVok0'); // change the id to the specified id
  var totalResponses = form.getResponses().length;
  var maxResponse = 10;
  if (totalResponses >= maxResponse){
    form.setAcceptingResponses(false);
  }
}
