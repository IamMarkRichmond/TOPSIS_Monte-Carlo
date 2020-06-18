function [ A ] = fits2( count )
%fits.m Random weight values based on PDFs
%   input arg is MC number of iterations
% Distribution type catagorical encoded as follows:
% 1=Extreme Value, 2=Normal, 3=Uniform, 4=Triangular
% 5=Logistic
%Input Weight
coeffs = 'coeffs2.xlsx';
B=xlsread(coeffs);
[len,~] = size(B(:,1));

for i = 1:len
    % 1 = Extreme Value
    if B(i,1) == 1
        for nc = 1:count
            A(nc,i)= evrnd(B(i,2),B(i,3));
            while A(nc,i) < 1 || A(nc,i) > 9
            A(nc,i)= evrnd(B(i,2),B(i,3));
            end
        end 

    % 2 = Normal
    else if B(i,1) == 2
        for nc = 1:count
            A(nc,i)= normrnd(B(i,2),B(i,3));
            while A(nc,i) < 1 || A(nc,i) > 9
                A(nc,i)= normrnd(B(i,2),B(i,3));
            end
        end
        
    % 3 = Uniform
    else if B(i,1) == 3
         for nc = 1:count
            A(nc,i)= unifrnd(B(i,2),B(i,3));
            while A(nc,i) < 1 || A(nc,i) > 9
                A(nc,i)= unifrnd(B(i,2),B(i,3));
            end
         end  

    % 4 = Triangular
    else if B(i,1) == 4
        pd(i) = makedist('Triangular','a',B(i,2),'b',B(i,3),'c',B(i,4));
        for nc = 1:count
            A(nc,i)= random(pd(i), 1);
            while A(nc,i) < 1 || A(nc,i) > 9
                A(nc,i)= random(pd(i), 1);
            end
        end

     % 5 = Logistic
     else if B(i,1) == 5
             pd(i) = makedist('Logistic','mu',B(i,2),'sigma',B(i,3));
        for nc = 1:count
            A(nc,i)= random(pd(i), 1);
            while A(nc,i) < 1 || A(nc,i) > 9
                A(nc,i)= random(pd(i), 1);
            end
        end

        end
        end
        end
        end
    end
end
end

        
         

