function output = combin(cardsLeft, cardsToBeDrawn)
% function output = FunctionName(cardsLeft, cardsToBeDrawn)
% 
% input: cards left in the deck and the cards to be put down on the table
% output: the total number of possible combinations
N=cardsLeft;
k=cardsToBeDrawn;
% output = factorial(cardsLeft)/(factorial(cardsToBeDrawn)*factorial(cardsLeft-cardsToBeDrawn));
output=prod(N-k+1:N)/factorial(k); 
end

