%% create_dialog_fit.m
%  Create a dialog consisting of 4 number inputs for curve fitting.
%  Return the user inputs.
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


function limits = create_dialog_fit(dialog_title)
    prompt = {'Enter lower limit 1', 'Enter upper limit 1', ...
        'Enter lower limit 2', 'Enter upper limit 2'};
    limits = inputdlg(prompt, dialog_title);
end