function [ x ] = permutations( d,n,R,J )
%matrix of combinations
c = nchoosek(1:d+n-1,n-1);
m = size(c,1);
t = ones(m,d+n-1);
t(repmat((1:m).',1,n-1)+(c-1)*m) = 0;
u = [zeros(1,m);t.';zeros(1,m)];
v = cumsum(u,1);
x = diff(reshape(v(u==0),n+1,m),1).';
x( x>R )=0;
%x = sort(x,2);
for i=1:length(x)
    if sum(x(i,:))~=d
        x(i,:)=zeros(1,n);
    elseif sum(x(i,(1:n-1)))>=J || sum(x(i,(1:n-2)))>=J || sum(x(i,(1:n-3)))>=J || sum(x(i,(1:n-4)))>=J
        x(i,:)=zeros(1,n);
    end
end
x( ~any(x,2), : ) = [];
y = zeros(size(x));
[nzrow,nzcol] = find(x ~= 0);
for i = 1:max(nzrow)
    y(i,1:length(find(nzrow==i))) = x(i,nzcol(nzrow==i));
end
x = unique(y, 'rows');
end
