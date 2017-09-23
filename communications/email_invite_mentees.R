# Script to send mail to a list of email addresses 
# with "Dear X" filled in with person's name

# For more details see: https://github.com/jennybc/send-email-with-r

#instructors = read.csv("Google Drive (erinstellabecker@gmail.com)/SWC-DC/Mentoring/active_instructors_2017_08_28.csv", stringsAsFactors = FALSE)

# Test emails
instructors = read.csv("Downloads/test_email_list.csv", stringsAsFactors = FALSE)

for(i in 1:nrow(instructors)) {
  name = instructors[i, "person_name"]
  instructors$first_name[i] = strsplit(name, " ")[[1]][1]
}

#if gmailr is not already installed do:
install.packages("gmailr") 
library(gmailr)

for(i in 1:nrow(instructors)) {
    name = paste0(instructors$first_name[i], ",")
    address = instructors$person_email[i]
    mentoring_email = mime(
      To = address,
      From = "kariljordan@carpentries.org",
      Subject = "Invitation to join new Carpentries Mentoring Program",
      body = paste("Dear", name, "

Thank you for becoming a part of the Software and Data Carpentry community! We are so glad you’ve joined us and that you share our vision of bringing computational and data literacy to the global research community. 

We’d like to invite you to become a part of our new Mentoring Program for new instructors. In the Mentoring Program, new instructors like yourself are matched with experienced instructors who will serve as your personal point of contact for all questions you might have about teaching for the Carpentries. We’ll try to match you with others in your local community whenever possible to help strengthen your local Carpentry community.

Your Mentor will hold regular meetings for your small Mentoring group (~5 people) to help prepare you for teaching in any way they can. Depending on your personal needs, they might hold practice teaching sessions or Q&A sessions on lesson content. They may help walk through logistical details for workshops or help you set up your workshop website. Basically, they’ll be there for you for whatever you need to get ready to teach.
                   
We strongly encourage you to take advantage of this Mentoring Program. If you’re interested in learning more, please RSVP to attend an information session. Sign up through this etherpad[1]. If you would like to be involved, but can’t attend an information session, please let me know.
                   
Mentors are dedicated, experienced instructors who are committed to helping new instructors become engaged members of the Carpentry community and we’re confident that you’ll benefit from their experience. Spaces in the program are limited. 
                   
We’re looking forward to seeing  you at an information session!
                   
Sincerely,
Erin Becker
                   
[1] http://pad.software-carpentry.org/mentorship-info")
      )
#    send_message(mentoring_email)
}

