# Script to send mail to a list of email addresses 
# with "Dear X" filled in with person's name

# For more details see: https://github.com/jennybc/send-email-with-r

instructors = read.csv("/Users/kariljordan/Data_Carpentry/my-forked-repos/mentoring-program/Communications/potential_mentees_2017.csv", stringsAsFactors = FALSE)

for(i in 1:nrow(instructors)) {
  name = instructors[i, "FIRSTNAME"]
  instructors$first_name[i] = strsplit(name, " ")[[1]][1]
}

#if gmailr is not already installed do:
install.packages("gmailr") 
library(gmailr)

for(i in 1:nrow(instructors)) {
    name = paste0(instructors$FIRSTNAME[i], ",")
    address = instructors$Email[i]
    mentoring_email = mime(
      To = address,
      From = "kariljordan@carpentries.org",
      Subject = "Invitation to join the Carpentries Mentoring Program",
      body = paste("Dear", name, "

Thank you for being a part of the Software and Data Carpentry community! We are delighted that you share our vision of bringing computational and data literacy to the global research community.

We invite you to join our Mentoring Program. In this short-term program, we match instructors with experienced community members who can answer questions you have about the Carpentries related to teaching, lesson maintenance, organizing workshops, and community building. If possible, we will try to match you with people close by to help strengthen your local Carpentries community.
                   
Your Mentor will hold regular meetings with your Mentoring group (these are usually small - around 4-5 people) to help prepare you to teach or to maintain lessons, depending on which group you sign up for. Mentors might hold practice teaching sessions or Q&A sessions on lesson content. They may walk through workshop logistics or help you create workshop websites. Each group will work differently as the mentor will try to meet the needs of individual groups.
                   
We strongly encourage you to take advantage of this Mentoring Program. If you are interested in joining, please sign up via this Google form [1].
                   
Mentors are dedicated, experienced instructors who are committed to helping you become engaged members of the Carpentries’ community. We are confident that you will benefit from their experience. Spaces in the program are limited, so please sign up as soon as you can. The deadline for applications is October 16th.
                   
Still not sure? We will be offering an information session on Monday, October 2nd at 22:00 UTC. You can bring any questions you have to that session. All the details of time zone conversion and how to connect are on this Etherpad [2]. In the meantime, check out the mentoring program repo[3] for details and important dates!
                   
We look forward to having you in the program!
                   
Regards
Kari L. Jordan and Belinda Weaver
                   
[1] https://goo.gl/forms/cLZr1vUGqWSi83HZ2
[2] http://pad.software-carpentry.org/mentorship-info
[3] https://github.com/carpentries/mentoring-program")
      )
    send_message(mentoring_email)
}

