%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Nicholas Cenedella
% Purpose: To Create a Black Jack program to tell odds and use count to
% determine when the bet should be raised
% 4/2/16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all
% close all
NumDecks= input('How many decks:'); %number of decks
Total_Card_count=52*NumDecks;
count=zeros(11,1);
count(:,:)=4*NumDecks;%All other cards with index equal card ace=1
count(10,:)=NumDecks*16;%ten
count(12)=0;
%^ All initail conditions for a BJ deck
next_round=1;
while next_round== 1
    clearvars playerCards Player1 deal_card NumValue
    playerCards=input('Cards out (yours first, dealers 1 second then rest)(K Q J=10)(A=11):');
    % ask the user for cards visible on table
    for i=1:length(playerCards)
        cards=playerCards(i);
        [count, Total_Card_count]  = scoreBJ(cards, count ,Total_Card_count);
    end
    Player1=[];
    deal_card=[];
    Player1(1)=playerCards(1);
    Player1(2)=playerCards(2);
    deal_card(1)=playerCards(3);
    NumValue=sum(Player1);
    if NumValue==21
        Disp('Blackjack')
    end
    [ y ]=Hit_or_Stand( Player1,count,Total_Card_count,deal_card );
    i=3;
    if y==1
        while y==1
            PlayerNewCard= input('Enter Card: ');
            cards=PlayerNewCard;
            [ count, Total_Card_count ] = scoreBJ(cards, count,Total_Card_count);
            Player1(i)=PlayerNewCard;
            i=i+1;
            if sum(Player1)<21
                [ y ]=Hit_or_Stand( Player1,count,Total_Card_count,deal_card );
            elseif sum(Player1)>21
                disp('Yo Busted, you lose');
            elseif sum(Player1)==21
                Disp('Blackjack')
            end
        end
    end
    while sum(deal_card) < 17
        dealersNewCard=input('Enter dealers Card: ');
        cards=dealersNewCard;
        [ count, Total_Card_count ] = scoreBJ(cards , count,Total_Card_count );
        deal_card(i)=dealersNewCard;
        i=i+1;
    end
    if sum(deal_card)>21
        disp('Dealer Bust, You win');
    end
    if sum(deal_card)>sum(Player1)
        disp('Dealers hand beat yours, you lose');
    elseif sum(deal_card)<sum(Player1)
        disp('Your hand beat the dealers');
    end
    
    next_round=input('would you like to play another round(1=y or 2=n)? ');
end
