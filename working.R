
df_ol <- dplyr::select(df, where(is.numeric))
df_ol

# handle incorrect latitude value:
df_ol$o_latitude_gda[which(df_ol$o_latitude_gda < -40)] <- NA
# handle incorrect longitude value
df_ol$o_longitude_gda[which(df_ol$o_longitude_gda < 80)] <- NA
# make incorrect years NA
df_ol$year[which(df_ol$year > 2020)] <- NA
df_ol$year[which(df_ol$year < 1900)] <- NA
# remove incorrect land use ID
# should we repair?
df_ol$lu_sel[which(df_ol$lu_sel < 0)] <- NA
# remove crazy pH
df_ol$p_hw_l123wq[which(df_ol$p_hw_l123wq < 0)] <- NA
df_ol$p_hw_l45wq[which(df_ol$p_hw_l45wq < 0)] <- NA
df_ol$p_hw_l123w[which(df_ol$p_hw_l123w < 0)] <- NA
df_ol$p_hw_l45w[which(df_ol$p_hw_l45w < 0)] <- NA
df_ol$p_hw_any_s_ggt30max[which(df_ol$p_hw_any_s_ggt30max < 0)] <- NA
# remove crazy ESP
df_ol$esp_l1wq[which(df_ol$esp_l1wq < 0)] <- NA
df_ol$esp_l4wq[which(df_ol$esp_l4wq < 0)] <- NA
df_ol$espl1w[which(df_ol$espl1w < 0)] <- NA
df_ol$esp_anylt30[which(df_ol$esp_anylt30 > 500)] <- NA
df_ol$esp_any_s_glt30[which(df_ol$esp_any_s_glt30 < 0)] <- NA

melt(df_ol) %>%
  ggplot(aes(factor(variable), value)) +
  facet_wrap(~ variable, scale="free") +
  geom_boxplot(outlier.size = 0.2) +
  theme_minimal()
