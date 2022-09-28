ggplot(data=penguins)+geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g))
ggplot(data = penguins,mapping = aes(x=flipper_length_mm,y=body_mass_g))+geom_point()
head(hotel_bookings)
colnames(hotel_bookings)
ggplot(data=hotel_bookings)+ geom_point(mapping =aes(x=lead_time, y=children) )
ggplot(data = hotel_bookings)+
  geom_point(mapping = aes(x=stays_in_weekend_nights,y=children))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel,fill=deposit_type))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel,fill=market_segment))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel))+
  facet_wrap(~deposit_type)+
  theme(axis.text.x = element_text(angle=45))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel))+
  facet_wrap(~market_segment)+
  theme(axis.text.x = element_text(angle=45))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel))+
  facet_grid(~deposit_type)+
  theme(axis.text.x = element_text(angle=45))
ggplot(data=hotel_bookings)+
  geom_bar(mapping = aes(x=distribution_channel))+
  facet_wrap(~deposit_type~market_segment)+
  theme(axis.text.x = element_text(angle=45))
ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=hotel))+
  facet_wrap(~market_segment)

#set filter on city hotel and Online TA
onlineta_city_hotels<-filter(hotel_bookings,
                             (hotel=="City Hotel"&
                               hotel_bookings$market_segment=="Online TA"))
view(onlineta_city_hotels)

#use pipe operation
onlineta_city_hotels_v2<-hotel_bookings%>%
  filter(hotel=="City Hotel")%>%
  filter(market_segment=="Online TA")
view(onlineta_city_hotels_v2)

#plot online v2 dataframe
ggplot(data=onlineta_city_hotels_v2)+
  geom_point(mapping = aes(x=lead_time,y=children))

#compare segment
ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=market_segment))+
  facet_wrap(~hotel)+
  labs(title = "market segment different")
mindate<-min(hotel_bookings$arrival_date_year)
maxdate<-max(hotel_bookings$arrival_date_year)
ggplot(data=hotel_bookings)+
  geom_bar(mapping=aes(x=market_segment))+
  facet_wrap(~hotel)+
  theme(axis.text.x = element_text(angle = 45))+
  labs(title = "Comparison of market segments by hotel type for hotel bookings",
       caption = paste0("Data from: ",mindate, " to ",maxdate),
       x="Market Segment",
       y="Number of Bookings")
ggsave('hotel_booking_chart.png',width = 7,
       height=7)
y="Number of Bookings")
ggsave('hotel_booking_chart.png',width = 16,
       height=8)
