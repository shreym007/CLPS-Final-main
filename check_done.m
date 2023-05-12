% After each move, the code needs to analyze the current state of the board
% and determine whether or not the game should still proceed 

function game_over = check_done(board)

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


                         

                         




    