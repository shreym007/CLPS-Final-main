% Initialize the board
board = zeros(8, 8); % 0 represents an empty space

% 1 represents a PLAYER ONE (ex. red piece), 2 represents a PLAYER 2 (ex.
% black piece). The board is set up like a conventional checkers board 

board(1:3, 2:2:8) = 1;
board(8:-1:6, 1:2:7) = 2;

disp(board);

% GAME LOOP UNTIL DONE - INCORPORATES ALL THE SEPARATE FUNCTION FILES WE
% MADE

while true 

    

