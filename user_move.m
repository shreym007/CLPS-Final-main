% Allowing the user to input his/her move
% Because our game board is a 2D array with numbers to represent the game
% pieces, it's best to use standard checkers notation to represent a MOVE 

% The code here will not run but rather serves to separate our various
% functions for easier understanding and code documentation!

function player_move = user_move()

    prompt = 'Please enter your move in conventional checkers notation (ex. "2-4"): ';
    move_str = input(prompt, 's');

    move_array_cells = strsplit(move_str, ' ');
    player_move = zeros(1, 4);
    for i = 1:4
        player_move(i) = str2double(move_array_cells{i});
    end
end

% We opted for this approach of "moving pieces" because we were unsure how
% to incorporate a mouse or keyboard for the player to physically click on
% a piece. We had more knowledge in arrays so decided to go with that!
