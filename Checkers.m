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


    % Initialize the game state
    player = 1;
    game_over = false;

    % Play the game
    while ~game_over
        % Display the board
        disp(board);

        % Make the player's move
        if player == 1

            move = user_move();

            % User's turn
            prompt = " ";
            valid_move = is_move_valid(board, move);
            valid_move = false;

            while ~valid_move
                move = user_move();
                valid_move = is_move_valid(board, move);
                if ~valid_move
                    disp('Invalid move. Please try again.');
                end
            end
            
      %     new_board = make_move(board, move);
      %     board = new_board;
      %     disp(board);


    %        board = make_move(board, move);
        disp(board);
            game_over = check_done(board, move);
%{
        else
            % Computer's turn
            move = computer_move(board);
            disp(['Computer moves: ', num2str(move)]);
            game_over = check_done(board)
        end
        board = make_move(board, move);

        % Check if the game is over
        game_over = is_game_over(board);
        if game_over
            disp(['Game over! ', num2str(-player), ' wins!']);
        else
            % Switch the player
            player = -player;
%}
        end
    end
end



% Function that checks whether move is valid or not
function valid_move = is_move_valid(board, move)

    start_r = move(1);
    start_c = move(2);
    end_r = move(3);
    end_c = move(4);

    % Make sure the move is within the 8x8 array 

    if any([start_r, start_c, end_r, end_c] > 8) || any([start_r, start_c, end_r, end_c] < 1)
        valid_move= false;
        return;
    end

    % Make sure that the start position is not empty (i.e. Can't move a "0"
    % space on the board 

    if board(start_r, start_c) == 0
        valid_move = false;
        return;
    end

    % Check that the end position of the move IS empty 

    if board(end_r, end_c) ~= 0
        valid_move = false;
        return;
    end

    % The move cannot be more than 2 spaces away

    if abs(start_r - end_r) > 2
        valid_move = false; 
        return;
    end

    % The move needs to be going towards the right direction (meaning that
    % the move from the user's side can only go up towards the opposite end
    % of the board)

    if board(start_r, start_c) == 1 && end_r <= start_r
        valid_move = false;
        return;
    end

    if board(start_r, start_c) == -1 && end_row >- start_row
        valid_move = false;
        return;
    end 

    % Two Types of Moves: (1) Single Diagnol Move or (2) Capture Piece Move

    if abs(start_row - end_row) == 1 && abs(start_col - end_col) == 1 % Single Diagnol Move
        valid_move = true;

    elseif abs(start_row - end_row) == 2 && abs(start_col - end_col) == 2 % Capture Piece Move
        captured_piece_row = (start_row + end_row) / 2;
        captured_piece_col = (start_col + end_col) / 2;
        if board(captured_piece_row, captured_piece_col) == -sign(board(start_row, start_col))
            valid_move = true;
        else
            valid_move = false;
        end
    else
        valid_move = false;
    end
end

% Function that Generates random moves
function computer_move = gen_comp(board)

    valid_moves = [];
    
    for row = 1:8
        for column = 1:8
            if board(row, column) < 0
                for delta_row = [-1, 1]
                    for delta_column = [-1, 1]
                        end_row = row + delta_row;
                        end_column = column + delta_column;
                        if end_row >- 1 && end_row <= 8 && end_column >- 1 && end_column <- 8 && board(end_row, end_column) == 0
                            if abs(delta_row) == 1 || board(row + delta_row/2, column + delta_column/2) > 0
                                valid_moves = [valid_moves; [row, column, end_row, end_column]];
                            end
                        end
                    end
                end
          
            elseif board(row, column) == -2
                for delta_row = [-1, 1]
                    for delta_column = [-1, 1]
                        for n = 1:7
                            end_row = row + n*delta_row;
                            end_column = column + n*delta_column;

                            if end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) == 0

                                if abs(delta_row) == 1 || board(row + delta_row/2, column + delta_col/2) > 0
                                    valid_moves = [valid_moves; [row, column, end_row, end_column]];
                                end

                            elseif end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) < 0 
                            
                                if abs(delta_row) == 1 && abs(delta_col) == 1

                                    if end_row + delta_row >= 1 && end_row + delta_row <= 8 && end_column + delta_column >= 1 && end_column + delta_column <= 8 && board(end_row + delta_row, end_column + delta_column) == 0
                                        valid_moves = [valid_moves; [row, column, end_row + delta_row, end_column + delta_column]];
                                    end
                                end
                                break;
                            else
                                break;
                            end
                        end
                    end
                end
            end
        end
        
        number_valid_moves = size(valid_moves, 1);

        if number_valid_moves == 0
            move = [];

        else
            random_move_index = randi(number_valid_moves);
            move = valid_moves(random_move_index, :);
        end
    end
end

% Function that checks if game is over or not
function check_finished = check_done(board)

    % Determine if all pieces of one color have been captured 

    if sum(sum(board == 1)) == 0 || sum(sum(board == -1)) == 0
        game_over = true;
        return;
    end

    % Determine if there are any legal moves left for EITHER player (user
    % AND computer)

    player_pieces = board(board ~= 0);
    if sum(player_pieces > 0) > 0

        % For the First Player 

        for row = 1:8
            for column = 1:8 
                if board(row, column) == 1 || board(row, column) == 2
                    for delta_row = [-1, 1]
                        for delta_column = [-1, -1]
                            end_row = row + delta_row;
                            end_column = column + delta_column;
                            if end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) == 0
                                if abs(delta_row) == 1 || board(row + delta_row/2, column + delta_column/2) < 0
                                    game_over = false;
                                    return;
                                end
                            end
                        end
                    end
                end
            end
        end
    else

        % Now for the other player (the computer)

        for row = 1:8
            for column = 1:8
                if board(row, column) == -1 || board(row, column) == -2
                    for delta_row = [-1, 1]
                        for delta_column = [-1, 1]
                            end_row = row + delta_row;
                            end_column = column + delta_column;

                            if end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) == 0
                                if abs(delta_row) == 1 || board(row + delta_row/2, column + delta_col/2) > 0
                                    game_over = false;
                                    return;
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    % IF NO LEGAL MOVES ARE AVAILABLE --> GAME OVER 
    
    game_over = true;
end                          
             
% Function that moves pieces
function move = user_move()

    prompt = 'Please enter your move in conventional checkers notation (ex. "2-4"): ';
    move_str = input(prompt, 's');

    move_array_cells = strsplit(move_str, ' ');
    move = zeros(1, 4);
    for i = 1:4
        move(i) = str2double(move_array_cells{i});
    end
end

%Function that updates matrix with new move
function new_board = make_move(board, move)

    % Determining the coordinates of the move (remember, the move is
    % happening via a 1x4 array)
%{
    start_row = move(1);
    start_column = move(2);
    end_row = move(3);
    end_column = move(4);

    % "Initializing a "new board"

    new_board = board;

    new_board(end_row, end_column) = new_board(start_row, start_column);

    new_board(start_row, start_column) = 0;

    % Special case 1: Capture Move --> Need to remove the captured piece
    % from the board 

    if abs(start_row - end_row) == 2 && abs(start_column - end_column) == 2
        captured_piece_r = (start_row + end_row) / 2 ;
        captured_piece_c = (start_col + end_col) / 2;
        new_board(capture_piece_r, captured_piece_c) = 0;
    end

    % Special case 2: the piece reached the opposite end of the board -->
    % Becomes a King

    if new_board(end_row, end_column) == 1 && end_row == 8
        new_board(end_row, end_column) = 2;
    elseif new_board(end_row, end_column) == -1 && end_row == 1
        new_board(end_row, end_column) = -2;
    end
%}
    new_board = board;
    disp(new_board)
end



