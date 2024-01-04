function [row] = return_it_where_val_is_reached(matrix, value, column)
    rows = size(matrix, 1);
    for i = 1:rows
        if matrix(i, column) >= value
            row = i;
            return
        end
    end
    row = rows+1;
    return
end