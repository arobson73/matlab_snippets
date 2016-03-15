function y = vector2frame(x,frame_size)
%this will chop the single row (or column)
%vector x into frames of size frame_size.
%if frame_size is not a multiple then it 
%will append zeros to the end of x
%so that it is a multiple, then proceed
%in slicing the x data into frames of length
%frame_size
len = length(x);
%number of zeros to append
num_zeros = roundup(length(x),frame_size) - len;
%make sure its row vector
x = reshape(x,[1,len]);
%append zeros
x= [x zeros(1,num_zeros)];
%slice into frames
y = reshape(x,frame_size,[]);
