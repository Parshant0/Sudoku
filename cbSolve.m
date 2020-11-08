function cbSolve(src, event,h)
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
    
   
%% solve my sudoku
    A_sol = SudokuBacktracker(A);
%% Promt the user that sudoku is solved
set(sudokugui.status,'string','SOLVED',...
                     'foregroundcolor',[0,0.39,0],...
                      'fontsize',15)
for ii = 1:9
    for jj = 1:9
        set(sudokugui.X(ii,jj),'string',num2str(A_sol(ii,jj)));
    end
end
