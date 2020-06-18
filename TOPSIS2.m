function [ C ] = TOPSIS2( A, B )
%TOPSIS2 Performs the TOPSIS
%   Detailed explanation goes here

%Normalise Alternative array
[m,n]=size(A);
Normfact=zeros(n,1);
for i=1:n
    for j=1:m
        Normfact(i)=Normfact(i)+A(j,i)^2;
    end
end
Normfact=Normfact.^(1/2);
for i=1:n
    Anorm(:,i)=A(:,i)./Normfact(i);
end

%Weighting
Aweight=zeros(size(A));
for i=1:n
    Aweight(:,i)=B(i).*Anorm(:,i);
end

%Positive Ideal and Negative Ideal solutions
PIS=zeros(n,1); NIS=zeros(n,1);
for j=1:n
        PIS(j)=max(Aweight(:,j));
end
for j=1:n
        NIS(j)=min(Aweight(:,j));
end

%Distance of each alternative from PIS and NIS
sip=zeros(m,1);
sin=zeros(m,1);
for i=1:m
    for j=1:n
        sip(i)=sip(i)+(Aweight(i,j)-PIS(j))^2;
        sin(i)=sin(i)+(Aweight(i,j)-NIS(j))^2;
    end
end
sip=sip.^(1/2);
sin=sin.^(1/2);
%Closeness

for i=1:m
    C(i)=sin(i)/(sip(i)+sin(i));
end
end

