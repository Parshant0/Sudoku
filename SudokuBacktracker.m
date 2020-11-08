function [A] = SudokuBacktracker(A)
[flag,A]=backtracking(A,1,1);
end

function [flag] = check(A,row_i,col_j,number)
flag = 0;
%% Column test
for ii = 1:9
    if ii~=row_i
        if A(ii,col_j) == number
            return
        end
    end
end

%% Row test

for jj = 1:9
    if jj~=col_j
        if A(row_i,jj) == number
            return
        end
    end
end


%% 3x3 grid tests
modRow = mod(row_i-1,3);
modCol = mod(col_j-1,3);

row_l = row_i - modRow;
col_l = col_j - modCol;

for ii = row_l:row_l+2
    for jj = col_l:col_l+2
        if(ii~=row_i) || (jj~=col_j)
            if A(ii,jj) == number
                return
            end
        end
    end
end

flag = 1;

end

%% Backtracking function
function [flag,A] = backtracking( A, ii, jj)

flag=0;
go=0;

         %% correcting indexes
if jj==10
jj=1;
ii=ii+1;
end

if ii==10
    flag=1;
    return;
end

           %% if cell is not zero
if(A(ii,jj)~=0)
    [flag,A]=backtracking(A,ii,jj+1);
    return;
end

          %% if cell is zero
number=1;
while number<=9&& flag~=1

    go=check(A,ii,jj,number);
    if go==1
        A(ii,jj)=number;
        [flag,A]=backtracking(A,ii,jj);
    end
    number=number+1;
end

if flag==0
    A(ii,jj)=0;
end
end