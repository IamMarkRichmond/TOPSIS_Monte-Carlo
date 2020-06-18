clc
clear
%clf
%Input alternative
AltData = 'Alternativedata.xlsx';
A=xlsread(AltData);
neg=[3,7,10,13,14,16,17,18];
[k,l]=size(neg);
for i=1:l
    A(:,neg(i))=A(:,neg(i))*(0-1);
end
[m,n]=size(A);

% Start MC sim
count = 100;
% Generate random Weight values from PDFs
B = fits2(count);

% Run TOPSIS nc times
for nc = 1:count
C(nc,:) = TOPSIS2(A,B(nc,:));
end

% Find Average C value
for i = 1:m
        Cavg(i)=sum(C(:,i))/count;
end

%xlswrite('TOPSISResults.xlsx',C,'Sheet2')

%Produce Ranking for each iteration
for nc = 1:count
    data = C(nc,:);
    [~,~,rnk]=unique(-data);
    Rank(nc,:)=rnk;
end 

% Determanistic Analysis for comparison
WeightData = 'Weightdata.xlsx';
Bdet = xlsread(WeightData);
Cdet = TOPSIS2(A,Bdet);
[~,~,detrnk] = unique(-Cdet);
detRank(:) = detrnk;

% Most common ranking, percentage confidence, 
% Average C value, stand dev as % of Cavg
% Determanistic rank and C for comparison
for i = 1:m
    RankFinal(i,1) = mode(Rank(:,i));
    RankFinal(i,2) = 100*sum(Rank(:,i) == RankFinal(i,1))/count;
    RankFinal(i,3) = Cavg(i);
    RankFinal(i,4) = 100*std(C(:,i))/Cavg(i);
    RankFinal(i,5) = detRank(i);
    RankFinal(i,6) = Cdet(i);
end
%xlswrite('TOPSISResults.xlsx',RankFinal, 'Sheet1')
%xlswrite('RankFinal.xlsx',RankFinal, 'Sheet1')

RankFinal
