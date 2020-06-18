Performs Monte-Carlo of TOPSIS MCDA

*script*

 - TOPSISmain.m -
Main script, run from this 
This script performs MC analysis of TOPSIS 'count' times
Also performs determanistic TOPSIS for comparison
Outputs are put into matrix FinalRank then written out as 'RankFinal.xlsx'

*Functions*

 - fits2.m -
function produces random values from 5 types of PDF 
1=Extreme Value, 2=Normal, 3=Uniform, 4=Triangular, 5=Logistic
Which one, and the associated coefficients, are read from file 'coeffs2.xlsx'.

 - TOPSIS2.m -
function actually performs each TOPSIS analysis 

*Input sheets*

 - Alternativedata.xlsx - 
holds input values for criteria satisfaction for each alternative 

 - coeffs2.xlsx - 
holds weight PDF values 1) catagorical for PDF type, 2) coeff 1, 3) coeff 2, 4) coeff 3 

 - Weightdata.xlsx -
holds mean values of criteria weighting for determanistic comparison -