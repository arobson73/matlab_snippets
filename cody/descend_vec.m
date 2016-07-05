function y = descend_vec(x)

%If x=[0,3,4,2,1] then y=[4,3,2,1,0]
y = sort(x(:)',2,'descend');
