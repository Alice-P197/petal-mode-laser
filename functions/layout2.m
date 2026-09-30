function layout2(count,single_imag_size,sizemartix,row_num)
%% count 当前图片索引
% single_imag_size 单张图尺寸 0~1
% sizematrix = [a,b,c,d] 
% a： x边距; b：y边距
% c： x方向图片平移量
% d： y方向图片平移量
% row_num 列数
%%
    size = single_imag_size;
    frontx = sizemartix(1);
    fronty = sizemartix(2);
    dx = sizemartix(3);
    dy = sizemartix(4);
    row_Idx=fix((count-1)/row_num); col_Idx=mod(count-1,row_num); 
    set(gca,'outer',[frontx+dx*col_Idx,fronty-dy*row_Idx,size,size]),
end       