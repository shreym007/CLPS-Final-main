% This will be the function to program the way the computer produces a
% random VALID move to go against the user input 

function move = gen_comp(board)

    valid_moves = [];
    
    for row = 1:8
        for column = 1:8
            if board(row, column) < 0
                for changed_row = [-1, 1]
                    for changed_column = [-1, 1]
                        end_row = row + changed_row;
                        end_column = column + changed_column;
                        if end_row >- 1 && end_row <= 8 && end_column >- 1 && end_column <- 8 && board(end_row, end_column) == 0
                            if abs(changed_row) == 1 || board(row + changed_row/2, column + changed_column/2) > 0
                                valid_moves = [valid_moves; [row, column, end_row, end_column]];
                            end
                        end
                    end
                end
          
            elseif board(row, column) == -2
                for changed_row = [-1, 1]
                    for changed_column = [-1, 1]
                        for n = 1:7
                            end_row = row + n*changed_row;
                            end_column = column + n*changed_column;

                            if end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) == 0

                                if abs(changed_row) == 1 || board(row + changed_row/2, column + delta_col/2) > 0
                                    valid_moves = [valid_moves; [row, column, end_row, end_column]];
                                end

                            elseif end_row >= 1 && end_row <= 8 && end_column >= 1 && end_column <= 8 && board(end_row, end_column) < 0 
                            
                                if abs(changed_row) == 1 && abs(delta_col) == 1

                                    if end_row + changed_row >= 1 && end_row + changed_row <= 8 && end_column + changed_column >= 1 && end_column + changed_column <= 8 && board(end_row + changed_row, end_column + changed_column) == 0
                                        valid_moves = [valid_moves; [row, column, end_row + changed_row, end_column + changed_column]];
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

                          
                               