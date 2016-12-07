function [ dealer_Bust_odds ] = BustOdds(deal_card,count,Total_Card_count)
% Used to calculate the percentage for the dealer to bust
% using the combin function total combination canbe determined
two_combos=0;
three_combos=0;
four_combos=0;
five_combos=0;
for i=2:11
    for j=2:11
        for k=2:11
            for u=2:11
                for v=2:11
                    bust=21-deal_card;
                    if i==11 && i+j+k+u+v>bust
                        i=1;
                    end
                    if j==11 && i+j+k+u+v>bust
                        j=1;
                    end
                    if k==11 && i+j+k+u+v>bust
                        k=1;
                    end
                    if u==11 && i+j+k+u+v>bust
                        u=1;
                    end
                    if v==11 && i+j+k+u+v>bust
                        v=1;
                    end
                    if i+j>bust && deal_card==11
                        bust=bust-10;
                    elseif i+j+k>bust && deal_card==11
                        bust=bust-10;
                    elseif i+j+k+u>bust && deal_card==11
                        bust=bust-10;
                    elseif i+j+k+u+v>bust && deal_card==11
                        bust=bust-10;
                    end
                    if i+j>bust && i<(17-deal_card)
                        combo=combin(count(i),1)*combin(count(j),1);
                        two_combos=two_combos+combo;
                    end
                    if i+j+k>bust && i+j<=17-deal_card
                        combo=combin(count(i),1)*combin(count(j),1)*combin(count(k),1);
                        three_combos=three_combos+combo;
                    end
                    if i+j+k+u>bust && i+j+k<=17-deal_card
                        combo=combin(count(i),1)*combin(count(j),1)*combin(count(k),1)*combin(count(u),1);
                        four_combos=four_combos+combo;
                    end
                    if i+j+k+u+v>bust && i+j+k+u<=17-deal_card
                        combo=combin(count(i),1)*combin(count(j),1)*combin(count(k),1)*combin(count(u),1);
                        five_combos=five_combos+combo;
                    end
                end
            end
        end
    end
end
tot_combos=0;
for i=1:4
    Tcombos=factorial(i)*combin(Total_Card_count,i);
    tot_combos=tot_combos+Tcombos;
end
Total_Bust_combos=two_combos+three_combos+four_combos;
dealer_Bust_odds=Total_Bust_combos/tot_combos;
end

% for i=2:11
%     for j=2:11
%         Tot_Comb=Tot_Comb+count(i)*count(j);
%         bust=21-deal_card;
%         if i==11 && i+j>bust
%             i=1;
%         end
%         if j==11 && i+j>bust
%             j=1;
%         end
%         if i+j>bust
%             combo=combin(count(i),1)*combin(count(j),1);
%             two_combos=two_combos+combo;
%         end
%     end
% end
% 3 card combos
% for i=2:11
%     for j=2:11
%         for u=2:11
%             Tot_Comb=Tot_Comb+count(i)*count(j)*count(u);
%             bust=21-deal_card;
%             if i==11 && i+j+u>bust
%                 i=1;
%             end
%             if j==11 && i+j+u>bust
%                 j=1;
%             end
%             if u==11 && i+j+u>bust
%                 u=1;
%             end
%             if i+j+u>bust && i+j<bust
%                 combo=combin(count(i),1)*combin(count(j),1)*combin(count(u),1);
%                 three_combos=three_combos+combo;
%             end
%         end
%     end
% end
% %four card combos
% for i=2:11
%     for j=2:11
%         for u=2:11
%             for v=2:11
%                 Tot_Comb=Tot_Comb+count(i)*count(j)*count(u)*count(v);
%                 bust=21-deal_card;
%                 if i==11 && i+j+u+v>bust
%                     i=1;
%                 end
%                 if j==11 && i+j+u+v>bust
%                     j=1;
%                 end
%                 if u==11 && i+j+u+v>bust
%                     u=1;
%                 end
%                 if v==11 && i+j+u+v>bust
%                     v=1;
%                 end
%                 if i+j+u+v>bust && i+j+u<bust && i+j<bust
%                     combo=count(i)*count(j)*count(u)*count(v);
%                     four_combos=four_combos+combo;
%                 end
%             end
%         end
%     end
% end
% % five card combos
% for i=2:11
%     for j=2:11
%         for u=2:11
%             for v=2:11
%                 for z=2:11
%                     Tot_Comb=Tot_Comb+count(i)*count(j)*count(u)*count(v);
%                     bust=21-deal_card;
%                     if i==11 && i+j+u+v+z>bust
%                         i=1;
%                     end
%                     if j==11 && i+j+u+v+z>bust
%                         j=1;
%                     end
%                     if u==11 && i+j+u+v+z>bust
%                         u=1;
%                     end
%                     if v==11 && i+j+u+v+z>bust
%                         v=1;
%                     end
%                     if z==11 && i+j+u+v+z>bust
%                         z=1;
%                     end
%                     if i+j+u+v+z>bust && i+j+u+v<bust && i+j+u<bust && i+j<bust
%                         combo=combin(count(i),1)*combin(count(j),1)*combin(count(u),1)*combin(count(v),1);
%                         five_combos=five_combos+combo;
%                     end
%                 end
%             end
%         end
%     end
% end
% Total_Bust_combos=two_combos+three_combos+four_combos+five_combos;
% dealer_Bust_odds=Total_Bust_combos/Tot_Comb;
% end
%
