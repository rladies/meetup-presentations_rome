# Make the Certificates

# devtools::install_github("forwards/certificate")
library(certificate)
# create a curriculum = "curriculum.md" file with a list of sklls
certificate::create_workshop_certificates(attendees = "participant",
                                          workshop = "name of the course",
                                          date =  as.Date("2023-xx-xx"),
                                          location = "Online",
                                          curriculum = "curriculum.md",
                                          certifier = "R-Ladies Rome",
                                          credentials = "course specifics",
                                          organization = "R-Ladies Global",
                                          organization_url = "rladies.org",
                                          dir = ".",
                                          title = "CERTIFICATE OF ATTENDANCE",
                                          action_text = "participated in the",
                                          curriculum_title = "Workshop contents: R-Programming",
                                          signature = "organisersKit/logo/logo.png",
                                          # signature_skip = ,
                                          logo = "Forwards",# "organisersKit/logo/logo.png"
                                          #border_image = ,
                                          #papersize = ,
                                          #keep_tex =
                                            )
