%% create_dialog.m
%  Create a dialog consisting of two number inputs.
%  Return the user inputs.
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux


function limits = create_dialog(dialog_title)
    prompt = {'Enter lower limit', 'Enter upper limit'};
    limits = inputdlg(prompt, dialog_title);
end