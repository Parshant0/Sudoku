clear all  %% to clear workspace
close all  %% to close all figures
clc %% clear all inputs and output


%% create a GUI window
window = figure('position',[0 0 400 500],...  %% 0-x  0-y 400 length  500 breadth
    'unit','pixels',...
    'name','Sudoku Solver',...
    'visible','on');

    movegui(window,'center');

%% create my sudoku cells
CornerX = 50;
CornerY = 410;
dx = 35;
dy = 35;
    for ii = 1:9
        for jj = 1:9
            xpos = CornerX + (jj-1)*dx;
            ypos = CornerY - (ii-1)*dy;
            sudokugui.X(ii,jj) = uicontrol( 'position',[xpos ypos dx dy],...
                                            'unit','pixels',...
                                            'background','w',...
                                            'foreground','k',...
                                            'style','edit',...
                                            'fontsize',14,...
                                            'fontweight','normal',...
                                            'enable','on',...
                                            'visible','on',...
                                            'KeyPressFcn',{@cbEntry, window,ii,jj});
        end
    end
    
    %% insert a title textbox
    sudokugui.title = uicontrol('position',[0 455 400 30],...
                             'unit','pixels',...
                             'Style','text',...
                             'String','Sodoku Solver',...
                             'fontSize',20,...
                             'Fontweight','normal',...
                             'backgroundcolor',[0.9 0.9 0.9],...
                             'foregroundcolor',[0.4 0.42 0.4627]);
                             
                            
    %% Insert a SOLVE button
    sudokugui.solve = uicontrol('position',[275 55 100 30],...
                                'Style','pushbutton',...
                                'string','Solve',...
                                'backgroundcolor',[0.2 0.22 0.25],...
                                'foregroundcolor','w',...
                                'callback',{@cbSolve,window});
                               
    
    %% insert a clear button
   sudokugui.clear = uicontrol('position',[275 15 100 30],...
                                'Style','pushbutton',...
                                'string','Clear',...
                                'backgroundcolor',[0.5 0.5 0.55],...
                                'foregroundcolor','w',...
                                'callback',{@cbClear,window});
                                                                        
                                        
%% Insert a status bar
sudokugui.status = uicontrol('position',[25 15 200 70 ],...
                             'style','text',...
                             'string','Hit SOLVE to solve me',...
                             'backgroundcolor',[0.9 0.9 0.9],...
                             'foregroundcolor',[0.4 0.42 0.4627],...
                             'fontsize',10,...                   
                             'HorizontalAlignment','Center');
                       
  set(window,'UserData',sudokugui)
