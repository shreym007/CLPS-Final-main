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
            valid_move = false; %#ok<NASGU> 
            valid_move = Check_Move_Validity(board, move);

            while ~valid_move
                disp('Invalid move. Please try again.');
                move = user_move();
                valid_move = Check_Move_Validity(board, move);
            end

            
           board = make_move(board, move);
          


        else
            % Computer's turn
            move = gen_comp(board);
            disp(['Computer moves: ', num2str(move)]);
            game_over = check_done(board);
        end
        board = make_move(board, move);

        % Check if the game is over
        game_over = check_done(board);
        if game_over
            disp(['Game over! ', num2str(-player), ' wins!']);
        else
            % Switch the player
            player = -player;

            disp(board);
        end
    end
end






                       
             


