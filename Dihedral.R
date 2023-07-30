data = data.frame("Planes(1 degree)" = c(111,200,220,311,222,400,331,420,422,333,511),
                  "Planes(2 degree)" = c(200,220,311,222,400,331,420,422,333,511,440),
                  "Cos phi" = c(0.5774,0.7071,0.8528,0.8704,0.5774,0.6882,0.9234,0.9129,0.9428,0.7778,0.8165),
                  "arc cos phi" = c(0.9553,0.7854,0.5495,0.5148,0.9553,0.8117,0.3940,0.4205,0.3398,0.6797,0.6155),
   "Angular Difference" = c(123.97839 , 117.7307 , 97.3574 , 84.22684 , 80.02074 , 63.37961 ,
                                         50.44466 , 45.89603 , 25.0221 , 0 , 0),
          "Angle" = c(54.7356 , 45 , 31.4822 , 29.4962 , 54.7356 , 46.5085 , 22.5746 , 24.0948 ,
                    19.4712 , 38.9424 , 35.2644) , "2_Theta" = c(38.4684 , 44.71609 , 
                                                                65.08939 , 78.21995 , 82.42605,
                                                                99.06718 , 112.00213 , 116.55076 , 137.42469, 
                                                                162.44679 , 162.44679) 
          )
head(data)
data$cosphi = cos(data$Angle)
head(data)
library(circular)
watson.test(data$Angular.Difference , alpha = 0.05 , dist = "vonmises")
watson.test(data$Angle , alpha = 0.05 , dist = "vonmises")
watson.test(data$X2_Theta , alpha = 0.05 , dist = "vonmises")
fitt = lm.circular(data$Angle , data$Angular.Difference)
fitt$rho
#fitttt = lm.circular(data$Angle , data$Angular.Difference, init = 0.0 , type = "c-l")
#fitttt
plot(density.circular(data$Angle , bw = 50))
plot(density.circular(data$Angular.Difference , bw = 50))
