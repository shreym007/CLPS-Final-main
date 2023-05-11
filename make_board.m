% Initialize the board
board = zeros(8, 8); % 0 represents an empty space

% 1 represents a PLAYER ONE (ex. red piece), -1 represents a PLAYER 2 (ex.
% black piece). The board is set up like a conventional checkers board 

% In our game, the user (a.k.a. us!) will be using the "1" pieces, while
% the computer generated moves will be using the "-1" pieces. 

board(1:3, 2:2:8) = 1;
board(8:-1:6, 1:2:7) = -1;

disp(board);