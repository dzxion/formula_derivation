function y_out = linear_interpolation(x_input,x_index_min,x_index_max,y_index_min,y_index_max)

    y_out = (x_input - x_index_min) * (y_index_max - y_index_min) / (x_index_max - x_index_min) + y_index_min;

end