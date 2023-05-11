% Following the User input of a conventional move, the code needs to update
% the 8x8 array with the "moved cells"

function new_board = make_move(board, move)

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
    disp(new_board)
end


