% This will be the function to program the way the computer produces a
% random VALID move to go against the user input 

function move = gen_comp(board)

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

                          
                               