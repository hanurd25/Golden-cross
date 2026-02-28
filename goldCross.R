library(quantmod)
library(ggplot2)
ticker <- "APPL"

# Data collection for the last year or 365 days
days <- 365 #days
getSymbols(ticker, from = Sys.Date() - 365*1, auto.assign = TRUE)

closes <- Cl(A)

sma50 <- SMA(closes, n = 50)
sma200 <- SMA(closes, n = 200)

golden_cross <- Lag(sma50) < Lag(sma200) & sma50 > sma200 & !is.na(sma50) & !is.na(sma200)

# Printing the golden cross data:
cross_dates <- index(golden_cross)[golden_cross]
print("Golden Cross dates:")
print(cross_dates)

df <- merge(closes, sma50, sma200, all = FALSE)
colnames(df) <- c("Close", "SMA50", "SMA200")

chart <- ggplot(data = as.data.frame(df), aes(x = index(df))) +
  geom_line(aes(y = Close, color = "Close"), size = 1) +
  geom_line(aes(y = SMA50, color = "SMA 50"), size = 1) +
  geom_line(aes(y = SMA200, color = "SMA 200"), size = 1) +
  geom_point(data = subset(as.data.frame(df), index(df) %in% cross_dates), 
             aes(y = SMA50), color = "gold", size = 4, shape = 18) +
  scale_color_manual(values = c("Close" = "black", "SMA 50" = "blue", "SMA 200" = "red")) +
  labs(title = paste("Alfen N.V. (", ticker, ") - Golden Cross (SMA50 > SMA200)", sep = ""),
       x = "Date", y = "Price (€)", color = "Legend") +
  theme_minimal() +
  theme(legend.position = "bottom")

print(chart)
