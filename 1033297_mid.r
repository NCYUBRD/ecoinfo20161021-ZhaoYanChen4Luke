---
  title: "mid-rmarkdown"
author: "ZhaoYan"
date: "2017年1月13日"
output: html_document
---
#一. 請隨機產生 10000 組正整數儲存成 vector 格式，並輸出成 random10k.csv (5%)
  
X <- c(sample.int(n = 10000))

##檔案輸出write.table()
write.table(X, file = "random10k.csv", sep = "," , row.names = F)

#二. 請使用 for 迴圈列出 15 個費布納西(Fibonacci)數列 (10%)


sequence <- 15
fib <- numeric(sequence)
##指定第一個數值為'1' ，第二個數值為'2'
fib[1] <- 1
fib[2] <- 2
###用for迴圈寫出前一個數值是由前兩個數值相加，我們已假設訂好前兩位，從第三個數值開始運算
for (i in 3:sequence) {
  fib[i] <- fib[i-2]+fib[i-1]
}
print(fib)



#三. 請將 sample_data.txt 輸入進 R 內，並完成以下計算 (55%)


setwd('C:\\R')

library(data.table)

##(a) 將 yyyymmddhh 轉成 POSIXct 時間戳記格式， 並新增為一個欄(variable)，命名為 timestamp。並將此 sample data 輸出為 sample_data_parsed.csv (以逗號分隔，具有欄位名稱)

d200601 <- fread('raw/200601_auto_hr.txt = ' ',  na.strings = c('-9991','-9995','-9996','-9997','-9998','-9999'))
                 
head(d200601)

###先確定是否為data.frame格式，在開始轉換

class(sample)
                 
d200601 [,timestamp:=as.POSIXct(strptime(yyyymmddhh-1,'%Y%m%d%H'))]
                 
 write.table(d200601 , file = "sample_data_parsed.csv", sep = ",", col.names = T, row.names = F)
                 
head(d200601)

####先將欄位名稱儲存成一個文字向量並命名成 colnamesC0M530
```
                 
colnamesC0M530 <-  c('stno', 'yyyymmddhh', 
                 'PS01', 'TX01', 'RH01',
                 'WD01', 'WD02', 'PP01', 
                 'SS01')

 ####定義'日'，'月'，'年'時間格式時間格式
day <- format.Date(timestamp,'%Y%m%d')
                 
month <- format.Date(timestamp,'%Y%m')
                 
year <- format.Date(timestamp,'%Y')

                 
##(b) 請計算 2014 年至 2015 年這個測站的每月平均氣溫、每月平均濕度、每月累積降水， 並用表格呈現。表格範例如下：
                 
1	2	3	4	5	...	12
月平均氣溫						...	
月平均濕度						...	
月累積降水						...	
##(c) 請計算 2014 年和 2015 年最冷月分別是在哪個月份？(提示：先計算月均溫)
                 
##(d) 在 2015 年最冷的那個月份中，該月中每日的最低溫平均是幾度C？
                 
##(e) 請計算 2014 年和 2015 年中，最熱的月分別是在哪個月份？
                 
##(f) 請計算 2014 年最熱的月份中，該月的每日最高溫平均為幾度C?
                 
##(g) 請算出 2014 至 2015 年中，最濕月份的平均溫度
                 
##(h) 請計算每個月的月溫差(每月最高溫減去每月最高溫，取兩年平均)，平均月溫差最大的是哪個月？

##(i) 請計算這兩年的年溫差平均(每年最高溫減去最低溫)                 

##(j) 溫量指數(warmth index)是 Kira (1945) 提出的一個生態氣候指標，其計算方式為:
                 
###(1) 若該月均溫高於 5 oC，則將該月份的月均溫減去 5 oC。
###(2) 若該月均溫低於或等於 5 oC，則令其為 0 oC
###(3) 將所有減去 5 oC 或當成 0 oC 的月均溫相加起來得到的數據稱為「溫量指數」
                 
請根據 (b) 所計算出的數值，算出 2014 至 2015 年的溫量指數。
##(k) 請使用 climatol package 繪製 2014 至 2015 的生態氣候圖(Ecological climate diagrams)。 提示：你需要計算出每個月的累積降水平均、每日最高溫平均、每日最低溫平均、每月絕對最低溫。 可參考繪製生態氣候圖
                 
#四. 請計算 Table 2 中的下列各子題 (30%)
                 
##(a) 請計算各島環境因子(total_cover, C, EC, ..., etc.) 的平均、 第一四分位數、中位數、第三四分位數、最大值及最小值以及標準差，並整理成如下表格：
                 
average	1st Qua.	mean	...	standard deviation
鋤頭嶼 total cover					
鋤頭嶼 C					
 鋤頭嶼 N					
....					
東吉嶼 total cover					
 ...					
西嶼坪嶼 rock_ratio					
 ##(b) 請分別列出 C, EC, K, Na, N 最高的五個樣區(plotid)
                 