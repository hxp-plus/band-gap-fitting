%% find_closest.m
%  For a given value and array, return the index of the closest value in
%  the array
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


function index_closest = find_closest(target, target_array)
    distance = abs(target - target_array);
    index_closest = find(distance == min(distance));
end