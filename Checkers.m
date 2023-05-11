function Checkers()
    % Initialize the game board
    board = zeros(8, 8);
    board(1:3:8, 2:2:8) = 1;
    board(2:2:8, 1:3:8) = -1;

    % Initialize the game state
    player = 1;
    game_over = false;

    % Play the game
    while ~game_over
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
            start_r = move(1);
            start_c = move(2);
            end_r = move(3);
            end_c = move(4);

            % Make sure the move is within the 8x8 array 

            if any([start_r, start_c, end_r, end_c] > 8) || any([start_r, start_c, end_r, end_c] < 1)
                check_valid = false;
                return;
            end

            check_valid = false;
            while ~check_valid
                move = user_move();
                check_valid = is_valid_move(board, move);
                if ~check_valid
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
