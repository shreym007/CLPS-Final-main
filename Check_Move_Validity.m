% Before the computer can generate it's own move, we must check if the user
% player even inputted a move that works by the rules of checkers. 

function check_valid = is_move_valid(board, move)

    start_r = move(1);
    start_c = move(2);
    end_r = move(3);
    end_c = move(4);