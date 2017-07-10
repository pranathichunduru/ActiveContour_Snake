function [xs ys ] = getsnakeptsopen(myfig)
fig =myfig;
global xy;
    axis tight;
    hold on;
    [x, y] = getpts(fig);
    x=x';y=y';
    temp=[x(1);y(1)];
    xy=[x;y];
    %xy=[xy,temp];%for closed 
    n=length(xy);
    t = 1:n;
    ts = 1: 0.1: n;
    xys = spline(t,xy,ts);
    xs = xys(1,:);
    ys = xys(2,:);
    xs=xs';
    ys=ys';
    hold all ;plot(xs,ys,'y');

end
