# Golden-cross
Golden cross pattern in R programming.
Using 50 and 200 moving average to achive this

``` R

golden_cross <- Lag(sma50) < Lag(sma200) & sma50 > sma200 & !is.na(sma50) & !is.na(sma200)

```


### Sources:
https://www.investopedia.com/terms/g/goldencross.asp
