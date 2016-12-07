function [ greaterthanodds ] = dealer_Greater_than( deal_card,count,Total_Card_count )
%returns the odds of getting 17 through 21 for the dealer
tic
greaterthanodds=zeros(1,5);
greater=(21:-1:17);
n=5;
R=11;
com=0;
temp=1;
combo=zeros(1,5);
Tcombo=zeros(1,5);
D=zeros(5,n);
%for dealcard=10 for 17
for i=1:5
    d=greater(i)-deal_card;
    J=17-deal_card;
    if d>0
    [x] = permutations( d,n,R,J );
%     if i<5
%         U=find(x(:,n)<=5-i);
%         x(U,:)=[];
%     end
    for k=1:length(x(:,1))
        A=x(k,:);
        L = A(A~=0);
        I=find(L==11);
        L(I)=1;
        W=hist(L,(1:10));
        H=[];
        for u=1:length(W)
            H(u)=combin(count(u),W(u))*factorial(W(u));
        end
%         B=count(L);
        temp=prod(H);
        D(i,length(L))=D(i,length(L))+temp;
    end
    elseif d<0
         D(i,length(L))=0;
    end
    temp=1;
end
for v=1:n
    Tcombo(v)=combin(Total_Card_count,v)*factorial(v);
    D(:,v)=D(:,v)/Tcombo(v);
end
temp=sum(D,2);
temp2=0;
for z=1:5
    temp2=temp2+temp(z);
    greaterthanodds(z)=temp2;
end
toc
end