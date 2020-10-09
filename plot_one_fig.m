%% plot_one_fig.m
%  Plot one figure.
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


function plot_one_fig(x, y0, legends, ...
    label_x, label_y, fig_title, label_position)
    plot(x, y0);
%     legend(legends,'Location', label_position, 'NumColumns', 1);
    xlabel(label_x, 'Interpreter', 'latex');
    ylabel(label_y, 'Interpreter', 'latex');
    title(fig_title, 'Interpreter', 'latex');
    grid on;
end