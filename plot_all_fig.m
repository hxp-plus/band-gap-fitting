%% plot_fig.m
%  Plot all figures
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


function plot_all_fig(x, y0, y1, y2, y3, y4, legends, ...
    label_x, label_y, fig_title, label_position)
    plot(x, y0);
    plot(x, y1);
    plot(x, y2);
    plot(x, y3);
    plot(x, y4);
    legend(legends,'Location', label_position, 'NumColumns', 1);
    xlabel(label_x, 'Interpreter', 'latex');
    ylabel(label_y, 'Interpreter', 'latex');
    title(fig_title, 'Interpreter', 'latex');
    grid on;
end