%% bandgap.m
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


%% Clear workspace and load data
clear;
clc;
load('data/band_gap.mat');


%% Constants
PLANK_CONST = 6.62e-34;
SPEED_OF_LIGHT = 3e8;
ELECTRON_VOLT = 1.6e-19;
FIT_TYPE = 'poly1';


%% Trying to Plot the original data
figure(1);
hold on;

plot_fig(flipud(base_line_x), ...
    flipud(base_line_y), ...
    flipud(transmittance_10min), ...
    flipud(transmittance_20min), ...
    flipud(transmittance_30min), ...
    flipud(transmittance_40min), ...
    {'0min', '10min', '20min', '30min', '40min'}, ...
    '$\lambda(nm)$', 'Transmittance(%)', 'Origin Data', ...
    'southeast');

hold off;
save_fig('original_data');


%% Plot the graph needed to solve band gap
figure(2);
hold on;

base_line_x_to_electron_volts = PLANK_CONST .* SPEED_OF_LIGHT .* ...
    (base_line_x.*(1e-9)).^(-1) ./ ELECTRON_VOLT;

plot_fig(base_line_x_to_electron_volts, ...
    (log((base_line_y ./ base_line_y).^(-1))).^2, ...
    (log((transmittance_10min ./ base_line_y).^(-1))).^2, ...
    (log((transmittance_20min ./ base_line_y).^(-1))).^2, ...
    (log((transmittance_30min ./ base_line_y).^(-1))).^2, ...
    (log((transmittance_40min ./ base_line_y).^(-1))).^2, ...
    {'0min', '10min', '20min', '30min', '40min'},...
    'Energy(eV)', '$(\alpha \hbar \omega)^2$', ...
    'Graph Needed to Solve Band Gap', ...
    'northwest');

hold off;

save_fig('graph_needed_to_solve_band_gap');


%% Show a dialog telling user to zoom graph
zoom_limits = create_dialog('Zoom Graph: Input Limits');
lower_limit = find_closest(str2double(zoom_limits(1)), ...
    base_line_x_to_electron_volts);
upper_limit = find_closest(str2double(zoom_limits(2)), ...
    base_line_x_to_electron_volts);

base_line_x_to_electron_volts_zoomed = ...
    base_line_x_to_electron_volts(lower_limit:upper_limit);
base_line_y_zoomed = base_line_y(lower_limit:upper_limit);
transmittance_10min_zoomed = ...
    transmittance_10min(lower_limit:upper_limit);
transmittance_20min_zoomed = ...
    transmittance_20min(lower_limit:upper_limit);
transmittance_30min_zoomed = ...
    transmittance_30min(lower_limit:upper_limit);
transmittance_40min_zoomed = ...
    transmittance_40min(lower_limit:upper_limit);

figure(3);
hold on;

plot_fig(base_line_x_to_electron_volts_zoomed, ...
    (log((base_line_y_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
    (log((transmittance_10min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
    (log((transmittance_20min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
    (log((transmittance_30min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
    (log((transmittance_40min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
    {'0min', '10min', '20min', '30min', '40min'},...
    'Energy(eV)', '$(\alpha \hbar \omega)^2$', ...
    'Graph Needed to Solve Band Gap', ...
    'northwest');

hold off;

save_fig('graph_needed_to_solve_band_gap_zoomed')


%% Fitting results
figure(4);
hold on;

plot_fig(base_line_x_to_electron_volts_zoomed, ...
        (log((base_line_y_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
        (log((transmittance_10min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
        (log((transmittance_20min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
        (log((transmittance_30min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
        (log((transmittance_40min_zoomed ./ base_line_y_zoomed).^(-1))).^2, ...
        {'0min', '10min', '20min', '30min', '40min'},...
        'Energy(eV)', '$(\alpha \hbar \omega)^2$', ...
        'Graph Needed to Solve Band Gap', ...
        'northwest');
    
zoom_limits = create_dialog('Fit Graph: Input Limits');
lower_limit = find_closest(str2double(zoom_limits(1)), ...
    base_line_x_to_electron_volts_zoomed);
upper_limit = find_closest(str2double(zoom_limits(2)), ...
    base_line_x_to_electron_volts_zoomed);

fit_and_plot(lower_limit, upper_limit, FIT_TYPE, ...
    base_line_x_to_electron_volts_zoomed, ...
    base_line_y_zoomed, ...
    transmittance_10min_zoomed, ...
    transmittance_20min_zoomed, ...
    transmittance_30min_zoomed, ...
    transmittance_40min_zoomed)

zoom_limits = create_dialog('Fit Graph: Input Limits');
lower_limit = find_closest(str2double(zoom_limits(1)), ...
    base_line_x_to_electron_volts_zoomed);
upper_limit = find_closest(str2double(zoom_limits(2)), ...
    base_line_x_to_electron_volts_zoomed);

fit_and_plot(lower_limit, upper_limit, FIT_TYPE, ...
    base_line_x_to_electron_volts_zoomed, ...
    base_line_y_zoomed, ...
    transmittance_10min_zoomed, ...
    transmittance_20min_zoomed, ...
    transmittance_30min_zoomed, ...
    transmittance_40min_zoomed);

legend({'0min', '10min', '20min', '30min', '40min'});
hold off;
save_fig('fitting_result')