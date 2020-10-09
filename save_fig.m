%% save_fig.m
%  Save figures in fig, png and eps formats under figures subdir.
%  author: hxp<hxp201406@gmail.com>
%  Version: MATLAB R2019b Linux

function save_fig(save_path)
    mkdir(['figures/' ,save_path]);
        savefig(['figures/', save_path ,'/' ,save_path ,'.fig']);
        print(gcf,['figures/', save_path, '/' , save_path, '.png'], ...
            '-dpng','-r600');
        saveas(gcf,['figures/', save_path, '/',save_path],'epsc');
    disp(['Saved:', save_path]);
end