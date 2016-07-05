function y = most_distant_points(x)

%Given a collection of points, return the indices of the rows that contain the two points most distant from one another. The input vector p has two columns corresponding to the x and y coordinates of each point. Return ix, the (sorted) pair of indices pointing to the remotest rows. There will always be one unique such pair of points.

%So if
% p = [0 0]
%     [1 0]
%     [2 2]
%     [0 1]

%Then
% ix = [1 3]
%That is, the two points p(1,:) and p(3,:) are farthest apart.
pths = get_paths(size(x,1));
mx=0;
y=[];
for i = 1: size(pths,1)
    rr = pths(i,1);
    rc = pths(i,2);
    dima = x(rr,:);
    dimb = x(rc,:);
    dis = dist(dima,dimb);
    if dis > mx
        y(1)=rr;
        y(2) =rc;    
        mx = dis;
    end
end

function y = dist(a,b)
%get the distance between the x,y point a and b
x_diff = abs(a(1) - b(1));
y_diff = abs(a(2) - b(2));
y = sqrt(x_diff^2 + y_diff^2);
end

function p = get_paths(len)
%1 2, 1 3, 1 4
%2 3, 2 4
%3 4
s=len;
p=[];
for i = 1: len-1
    for j=i+1:s
        p = [p ; [i j]];
    end 

end
end

end
