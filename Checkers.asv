function Checkers()
    % Initialize the game board
    board = zeros(8, 8);
    board(1:3:8, 2:2:8) = 1;
    board(2:2:8, 1:3:8) = -1;

    % Initialize the game state
    player = 1;
    game_over = false;

    % Play the game
    while game_over ~= True
        % Display the board
        disp(board);

        %Enter Move Validity Code
        prompt = 'Please enter your move in conventional checkers notation (ex. "2-4"): ';
        move_str = input(prompt, 's');

        move_array_cells = strssplit(move_str, ' ');
        player_move = zeros(1, 4);
        for i = 1:4
            player_move(i) = str2double(move_array_cells{i});
        end
    end

        % Make the player's move
        if player == 1
            start_r = player_move(1);
            start_c = player_move(2);
            end_r = player_move(3);
            end_c = player_move(4);
            
            check_valid = True;
            % Make sure the move is within the 8x8 array 

            if any([start_r, start_c, end_r, end_c] > 8) || any([start_r, start_c, end_r, end_c] < 1)
                check_valid = False;
            end

            while check_valid ~= True
                move = user_move();
                check_valid = is_valid_move(board, move);
                if ~check_valid
                    disp('Invalid move. Please try again.');
                end
            end

             % Determining the coordinates of the move (remember, the move is
             % happening via a 1x4 array)

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
        else
            % Computer's turn
            move = generate_computer_move(board);
            disp(['Computer moves: ', num2str(move)]);

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

        end
        board = make_move(board, move);
        
        f sum(sum(board == 1)) == 0 || sum(sum(board == -1)) == 0
        game_over = true;
        return;

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

        % Check if the game is over
        game_over = is_game_over(board);
        if game_over
            disp(['Game over! ', num2str(-player), ' wins!']);
        else
            % Switch the player
            player = -player;
        end
end



