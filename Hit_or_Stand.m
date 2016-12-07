function [ y,count,Total_Card_count,Player1 ] = Hit_or_Stand( Player1, count,Total_Card_count,deal_card )
%Tells the player whether to hit or stay
%   compares the chance of dealer busting to their own
%%%%%%% Below are odds
NumValue=sum(Player1);
index=21-NumValue;
if index<10
    d=count(index+1:10);
    needed=sum(d);
    odds_to_bust=needed/Total_Card_count;
    % odds for the dealer to get a better hand than you 
    [greaterthanodds]=dealer_Greater_than( deal_card,count,Total_Card_count);
    if 17>NumValue
        Better_Hand_odds=greaterthanodds(5);
    elseif NumValue==17
        Better_Hand_odds=greaterthanodds(4);
    elseif NumValue==18
        Better_Hand_odds=greaterthanodds(3);
    elseif NumValue==19
        Better_Hand_odds=greaterthanodds(2);
    elseif NumValue==20
        Better_Hand_odds=greaterthanodds(1);
    end
    % [dealer_Bust_odds]=BustOdds(deal_card,count,Total_Card_count);
    % fprintf('odds of dealer busting: %4.2f percent.\n',dealer_Bust_odds*100);
    fprintf('odds of you busting: %4.2f percent.\n',odds_to_bust*100);
    fprintf('odds of dealer having a better hand: %4.2f percent.\n',Better_Hand_odds*100);
    if Better_Hand_odds>odds_to_bust
        disp('Hit');
        y=1;
    elseif odds_to_bust>Better_Hand_odds
        disp('Stand');
        y=0;
    end
elseif index>=10
    disp('Hit');
    y=1;
end
end

