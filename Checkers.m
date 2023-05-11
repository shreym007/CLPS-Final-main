function Checkers()
    % Initialize the game board
    board = zeros(8, 8); % create an 8x8 matrix filled with zeros

% set up the black pieces in the top three rows
for row = 1:3
    for col = mod(row, 2)+1:2:8
        board(row, col) = 1;
    end
end

% set up the white pieces in the bottom three rows
for row = 6:8
    for col = mod(row, 2)+1:2:8
        board(row, col) = -1;
    end
end

disp(board);

    % Initialize the game state
    player = 1;
    game_over = false;

    % Play the game
    while ~game_over
        % Display the board
        disp(board);

        % Make the player's move
        if player == 1
            % User's turn
            valid_move = false;
            while ~valid_move
                move = user_move();
                valid_move = is_valid_move(board, move);
                if ~valid_move
                    disp('Invalid move. Please try again.');
                end
            end
        else
            % Computer's turn
            move = generate_computer_move(board);
            disp(['Computer moves: ', num2str(move)]);
        end
        board = make_move(board, move);

        % Check if the game is over
        game_over = is_game_over(board);
        if game_over
            disp(['Game over! ', num2str(-player), ' wins!']);
        else
            % Switch the player
            player = -player;
        end
    end
end

function move = user_move()
    % Prompt the user to input a move
    prompt = 'Enter your move in standard checkers notation (e.g. "3-4 4-5"): ';
    move_str = input(prompt, 's');

    % Convert the move string to a 1x4 array
    move_cells = strsplit(move_str, ' ');
    move = zeros(1, 4);
    for i = 1:4
        move(i) = str2double(move_cells{i});
    end
end


function check_valid = is_move_valid(board, move)

    start_r = move(1);
    start_c = move(2);
    end_r = move(3);
    end_c = move(4);

    % Make sure the move is within the 8x8 array 

    if any([start_r, start_c, end_r, end_c] > 8) || any([start_r, start_c, end_r, end_c] < 1)
        check_valid = false;
        return;
    end

    % Make sure that the start position is not empty (i.e. Can't move a "0"
    % space on the board 

    if board(start_r, start_c) == 0
        check_valid = false;
        return;
    end

    % Check that the end position of the move IS empty 

    if board(end_r, end_c) ~= 0
        check_valid = false;
        return;
    end

    % The move cannot be more than 2 spaces away

    if abs(start_r - end_r) > 2
        check_valid = false;
        return;
    end

    % The move needs to be going towards the right direction (meaning that
    % the move from the user's side can only go up towards the opposite end
    % of the board)

    if board(start_r, start_c) == 1 && end_r <= start_r
        check_valid = false;
        return;
    end

    if board(start_r, start_c) == -1 && end_row >- start_row
        check_valid = false;
        return;
    end 

    % Two Types of Moves: (1) Single Diagnol Move or (2) Capture Piece Move

    if abs(start_row - end_row) == 1 && abs(start_col - end_col) == 1 % Single Diagnol Move
        check_valid = true;

    elseif abs(start_row - end_row) == 2 && abs(start_col - end_col) == 2 % Capture Piece Move
        captured_piece_row = (start_row + end_row) / 2;
        captured_piece_col = (start_col + end_col) / 2;
        if board(captured_piece_row, captured_piece_col) == -sign(board(start_row, start_col))
            check_valid = true;
        else
            check_valid = false;
        end
    else
        check_valid = false;
    end
end




