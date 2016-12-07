function [ count, Total_Card_count ] = scoreBJ( cards, count,Total_Card_count)
%Goes through cards and determines the count for the current hand
%   minus 1 for all 10+ cards and plus 1 for 2-6
    card=cards;
    count(card)=count(card)-1;
    Total_Card_count=Total_Card_count-1;
    if card==11;
        count(1)=count(1)-1;
    end
end

