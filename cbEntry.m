function [output_args] = cbEntry(src,event,h,row_i,col_j)

sudokugui=get(h,'userdata');


for i=1:9
    for j=1:9
        if isempty(get(sudokugui.X(i,j),'string'))
        set(sudokugui.X(i,j),'fontweight','normal',...
                                'backgroundcolor','w',...
                                'foregroundcolor','k');
        end
    end
end


set(sudokugui.X(row_i,col_j),'fontweight','bold',...
                             'backgroundcolor','k',...
                             'foregroundcolor','w');

%%% Handle Conflict
A(9,9)=0;
%% Read my Sudokugui
    sudokugui = get(h,'UserData');
    for ii = 1:9
        for jj= 1:9
            string_ij = get(sudokugui.X(ii,jj),'string');
            if(isempty(string_ij))
                A(ii,jj) = 0;
            else
                A(ii,jj) = str2double(string_ij);
            end
        end
    end
    
%% handle any sort of invalid cells
    for ii = 1:9
        for jj = 1:9
            if(A(ii,jj)>9 || A(ii,jj)<0 || isnan(A(ii,jj)))
               set(sudokugui.status,'string','Invalid entry',...
                      'foregroundcolor',[0.69,0,0.125],...
                      'fontsize',14);
                  set(sudokugui.X(ii,jj),'backgroundcolor',[0.69,0,0.125]);
               return
            end
        end
    end


%% Handle any type of conflics
    for ii = 1:9
        for jj = 1:9
            if (A(ii,jj)~=0)
                if ConflictAdvanceTest(A,ii,jj)
                    set(sudokugui.status,'string','Conflicts',...
                        'foregroundcolor',[0.69,0,0.125],...
                        'fontsize',14);
                    set(sudokugui.X(ii,jj),'backgroundcolor',[0.69,0,0.125]);
                    return
                end
            end
        end
    end
    

%%%%%%%%%%%


                         
end      


%{
 'backgroundcolor',[0.9 0.9 0.9],...
                             'foregroundcolor',[0.4 0.42 0.4627]);
%}