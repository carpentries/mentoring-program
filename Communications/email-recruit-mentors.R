# Script to send mail to a list of email addresses 
# with "Dear X" filled in with person's name

# For more details see: https://github.com/jennybc/send-email-with-r

instructors = read.csv("/Users/kariljordan/Data_Carpentry/my-forked-repos/mentoring-program/Communications/potential_mentors_2017.csv.csv", stringsAsFactors = FALSE)

for(i in 1:nrow(instructors)) {
  name = instructors[i, "FIRSTNAME"]
  instructors$first_name[i] = strsplit(name, " ")[[1]][1]
}

#if gmailr is not already installed do:
#install.packages("gmailr") 
library(gmailr)

for(i in 1:nrow(instructors)) {
    name = paste0(instructors$FIRSTNAME[i], ",")
    address = instructors$Email[i]
    mentoring_email = mime(
      To = address,
      From = "kariljordan@carpentries.org",
      Subject = "Invitation to join the Carpentries Mentoring Program",
      body = paste("Dear", name, "

The inaugural Carpentries mentoring program was a great success, and we have used the feedback we received from both mentors and mentees to craft a new and improved mentoring experience for both mentors and mentees in round two.

We’d like to invite you to join our new Mentoring Program! In the Mentoring Program, participants have the opportunity to learn from each other and reach specific goals around teaching, lesson maintenance, workshop operations, and/or community building.
                   
Our Mentors are experienced instructors who are committed to helping others become engaged members of the Carpentries community. Mentors have told us they really enjoy being involved with this program. 
                   
We invite you to serve as a mentor for round two. If you are interested in learning more, please sign up for the information session on October 2nd at 22:00 UTC on this Etherpad [1]. If you would like to be involved, but can’t attend the information session, please let us know. The deadline to sign up to be a mentor is October 16th. To apply, simply complete the Google form for mentors [2].
                   
Lastly, check out the mentoring program repo [3] for details and important dates!
                   
We look forward to having you in the program!
                   
Sincerely,
Kari L. Jordan and Belinda Weaver
[1] http://pad.software-carpentry.org/mentorship-info
[2] https://goo.gl/forms/z8Bfjldu2gpNQb8B3
[3] https://github.com/carpentries/mentoring-program")
      )
    send_message(mentoring_email)
}

