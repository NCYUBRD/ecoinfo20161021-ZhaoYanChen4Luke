---
  title: "mid-rmarkdown"
author: "ZhaoYan"
date: "2017�~1��13��"
output: html_document
---
#�@. ���H������ 10000 �ե�����x�s�� vector �榡�A�ÿ�X�� random10k.csv (5%)
  
X <- c(sample.int(n = 10000))

##�ɮ׿�Xwrite.table()
write.table(X, file = "random10k.csv", sep = "," , row.names = F)

#�G. �Шϥ� for �j��C�X 15 �ӶO���Ǧ�(Fibonacci)�ƦC (10%)


sequence <- 15
fib <- numeric(sequence)
##���w�Ĥ@�ӼƭȬ�'1' �A�ĤG�ӼƭȬ�'2'
fib[1] <- 1
fib[2] <- 2
###��for�j��g�X�e�@�ӼƭȬO�ѫe��ӼƭȬۥ[�A�ڭ̤w���]�q�n�e���A�q�ĤT�Ӽƭȶ}�l�B��
for (i in 3:sequence) {
  fib[i] <- fib[i-2]+fib[i-1]
}
print(fib)



#�T. �бN sample_data.txt ��J�i R ���A�ç����H�U�p�� (55%)


setwd('C:\\R')

library(data.table)

##(a) �N yyyymmddhh �ন POSIXct �ɶ��W�O�榡�A �÷s�W���@����(variable)�A�R�W�� timestamp�C�ñN�� sample data ��X�� sample_data_parsed.csv (�H�r�����j�A�㦳���W��)

d200601 <- fread('raw/200601_auto_hr.txt = ' ',  na.strings = c('-9991','-9995','-9996','-9997','-9998','-9999'))
                 
head(d200601)

###���T�w�O�_��data.frame�榡�A�b�}�l�ഫ

class(sample)
                 
d200601 [,timestamp:=as.POSIXct(strptime(yyyymmddhh-1,'%Y%m%d%H'))]
                 
 write.table(d200601 , file = "sample_data_parsed.csv", sep = ",", col.names = T, row.names = F)
                 
head(d200601)

####���N���W���x�s���@�Ӥ�r�V�q�éR�W�� colnamesC0M530
```
                 
colnamesC0M530 <-  c('stno', 'yyyymmddhh', 
                 'PS01', 'TX01', 'RH01',
                 'WD01', 'WD02', 'PP01', 
                 'SS01')

 ####�w�q'��'�A'��'�A'�~'�ɶ��榡�ɶ��榡
day <- format.Date(timestamp,'%Y%m%d')
                 
month <- format.Date(timestamp,'%Y%m')
                 
year <- format.Date(timestamp,'%Y')

                 
##(b) �Эp�� 2014 �~�� 2015 �~�o�Ӵ������C�륭����šB�C�륭����סB�C��ֿn�����A �åΪ��e�{�C���d�Ҧp�U�G
                 
1	2	3	4	5	...	12
�륭�����						...	
�륭�����						...	
��ֿn����						...	
##(c) �Эp�� 2014 �~�M 2015 �~�̧N����O�O�b���Ӥ���H(���ܡG���p��맡��)
                 
##(d) �b 2015 �~�̧N�����Ӥ�����A�Ӥ뤤�C�骺�̧C�ť����O�X��C�H
                 
##(e) �Эp�� 2014 �~�M 2015 �~���A�̼�������O�O�b���Ӥ���H
                 
##(f) �Эp�� 2014 �~�̼���������A�Ӥ몺�C��̰��ť������X��C?
                 
##(g) �к�X 2014 �� 2015 �~���A�������������ū�
                 
##(h) �Эp��C�Ӥ몺��Ůt(�C��̰��Ŵ�h�C��̰��šA����~����)�A������Ůt�̤j���O���Ӥ�H

##(i) �Эp��o��~���~�Ůt����(�C�~�̰��Ŵ�h�̧C��)                 

##(j) �Ŷq����(warmth index)�O Kira (1945) ���X���@�ӥͺA��ԫ��СA��p��覡��:
                 
###(1) �Y�Ӥ맡�Ű��� 5 oC�A�h�N�Ӥ�����맡�Ŵ�h 5 oC�C
###(2) �Y�Ӥ맡�ŧC��ε��� 5 oC�A�h�O�䬰 0 oC
###(3) �N�Ҧ���h 5 oC �η� 0 oC ���맡�Ŭۥ[�_�ӱo�쪺�ƾں٬��u�Ŷq���ơv
                 
�Юھ� (b) �ҭp��X���ƭȡA��X 2014 �� 2015 �~���Ŷq���ơC
##(k) �Шϥ� climatol package ø�s 2014 �� 2015 ���ͺA��Թ�(Ecological climate diagrams)�C ���ܡG�A�ݭn�p��X�C�Ӥ몺�ֿn���������B�C��̰��ť����B�C��̧C�ť����B�C�뵴��̧C�šC �i�Ѧ�ø�s�ͺA��Թ�
                 
#�|. �Эp�� Table 2 �����U�C�U�l�D (30%)
                 
##(a) �Эp��U�q���Ҧ]�l(total_cover, C, EC, ..., etc.) �������B �Ĥ@�|����ơB����ơB�ĤT�|����ơB�̤j�Ȥγ̤p�ȥH�μзǮt�A�þ�z���p�U���G
                 
average	1st Qua.	mean	...	standard deviation
�S�Y�� total cover					
�S�Y�� C					
 �S�Y�� N					
....					
�F�N�� total cover					
 ...					
�����W�� rock_ratio					
 ##(b) �Ф��O�C�X C, EC, K, Na, N �̰������Ӽ˰�(plotid)
                 