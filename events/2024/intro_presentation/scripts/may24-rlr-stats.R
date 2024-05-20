library(meetupr)
library(tidyverse)

rladies_rome <- get_events("rladies-rome")
events_rsvp <- rladies_rome %>%
  select(id,time,going)%>%
  mutate(time = as.Date(time,origin="1970-01-01"),
         time_id=row_number(time)) %>%
  arrange(time_id)%>%
  group_by(time_id,time) %>%
  reframe(going = sum(going))%>%
  mutate(tot_going = cumsum(going))
saveRDS(events_rsvp, "events/2024/intro_presentation/data/events_rsvp.rds")

events_rsvp%>%View
tot_going <- events_rsvp$tot_going[1:7]
time <- events_rsvp$time[1:7]
plot(time, tot_going)

events_rsvp%>%
  ggplot(aes(x = time_id, y = tot_going)) +
  geom_line()
  scale_x_date(date_labels = "%b-%Y") +
  labs(title = "R-Ladies Rome Events RSVP",
       x = "Date",
       y = "Number of Attendees") +
  theme_minimal()

rladies_rome_members <- meetupr::get_members("rladies-rome")
saveRDS(rladies_rome_members, "data/rladies_rome_members.rds")
tot_members <- rladies_rome_members%>%
  mutate(created = as.Date(created,origin="1970-01-01"))%>%
  group_by(created)%>%
  reframe(members=n())%>%
  mutate(tot=cumsum(members))

tot_members%>%
  ggplot(aes(x = created,y=tot)) +
  geom_line() +
  geom_point(size=0.2) +
  scale_x_date(date_labels = "%b-%Y") +
  labs(title = "R-Ladies Rome Membership Registration Growth",
       subtitle = "Cumulative number of members",
       x = "Time(month-year)",
       y = "Number of Members",
       caption = "DataSource: {meetpr} R-package | Graphics: Federica Gazzelloni") +
  theme_minimal()


tot_members%>%
  # create a year month vector
  mutate(ym=zoo::as.yearmon(created))%>%
  group_by(ym)%>%
  reframe(tot_mem_ym=sum(tot))%>%
  mutate(tot_ym_growth=cumsum(tot_mem_ym),
         pct=lag(lead(tot_ym_growth,1)-tot_ym_growth)/tot_ym_growth*100)%>%
  ggplot(aes(ym,pct))+
  geom_line()
