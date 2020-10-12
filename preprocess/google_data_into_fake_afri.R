library(dplyr)
google_mob_za=read.csv("C:/Users/Xaviervollenweider/Documents/Flowminder/COVID/DRC/hand_over/data/google/2020_ZA_Region_Mobility_Report.csv")

head(google_mob_za)
google_mob_za_nat=google_mob_za%>%
  filter(sub_region_1=="")%>%
  select(date,transit_stations_percent_change_from_baseline)%>%  # workplaces_percent_change_from_baseline
  mutate(date=as.Date(date), 
         F_id="relation/10713870")%>%
  filter(date>=as.Date("2020-02-01"),
         date<=as.Date("2020-09-17"))%>%
  rename(pres_norm=transit_stations_percent_change_from_baseline,
         DATE=date)

head(google_mob_za_nat)

write.csv(google_mob_za_nat,
          "C:/Users/Xaviervollenweider/Documents/Flowminder/COVID/DRC/hand_over/data/fake/google_ZA.csv",
          row.names = F)

