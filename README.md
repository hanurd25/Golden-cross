# Golden-cross
Golden cross pattern recognition in R programming.

Using 50 and 200 day (simple) moving average to achive this:
``` R
sma50 <- SMA(closes, n = 50)
sma200 <- SMA(closes, n = 200)
```



### Packages:
``` R
#install.packages(c("quantmod", "ggplot2"))
library(quantmod)
library(ggplot2)
```


### Golden Cross detection
``` R

golden_cross <- Lag(sma50) < Lag(sma200) & sma50 > sma200 & !is.na(sma50) & !is.na(sma200)

```


### Sources:
https://www.investopedia.com/terms/g/goldencross.asp
