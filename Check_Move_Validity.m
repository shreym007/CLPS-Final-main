% Before the computer can generate it's own move, we must check if the user
% player even inputted a move that works by the rules of checkers. 

function check_valid = Check_Move_Validity(board, move)

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

    if board(start_r, start_c) == -1 && end_r >- start_r
        check_valid = false;
        return;
    end 

    % Two Types of Moves: (1) Single Diagnol Move or (2) Capture Piece Move

    if abs(start_r - end_r) == 1 && abs(start_c - end_c) == 1 % Single Diagnol Move
        check_valid = true;

    elseif abs(start_r - end_r) == 2 && abs(start_c - end_c) == 2 % Capture Piece Move
        captured_piece_r = (start_r + end_r) / 2;
        captured_piece_c = (start_c + end_c) / 2;
        if board(captured_piece_r, captured_piece_c) == -sign(board(start_r, start_c))
            check_valid = true;
        else
            check_valid = false;
        end
    else
        check_valid = false;
    end
end


