function cbClear(src,event,h)
    
    sudokugui = get(h,'UserData');
    
    for ii = 1:9
        for jj = 1:9
            set(sudokugui.X(ii,jj),'string',[],...
                'background','W',...
                'foregroundcolor','k',...
                'fontweight','normal');
        end
    end
    
    set(sudokugui.status,'string','Hit SOLVE to solve me again',...
                          'fontsize',10,...
                          'foregroundcolor',[0.4 0.42 0.4627]);
    
