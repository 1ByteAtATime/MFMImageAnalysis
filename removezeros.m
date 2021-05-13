% replace zeros with nan

for i=2
    A = importdata(['LS340_20190729_0' num2str(i,'%02d'),'.dat']);
%     A(A == 0) = NaN;
%     if A.data(:) == 0;
%         A(:) = [ ];
%     else
%         A(:) = A(:);
%     end
    writetable(struct2table(A), 'somefile.txt')
    writematrix(['nozerosLS340_20181214_0' num2str(i,'%02d'),'.dat'], A);
end

