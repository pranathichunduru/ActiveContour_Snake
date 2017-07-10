

function [xs ys] = snakeiterationsopen(image,Ainv ,xs,ys,gamma,kappa,fx,fy,iterations)
%alpha = rigidity /stiffness
% function for moving iterations over control points
N= iterations;

% % Clamp contour to boundary
% xs=min(max(xs),size(fx));
% ys=min(max(ys),size(fy));
% 
% Interp2, can give nan's if contour close to border
% fx(isnan(fx))=0;
% fy(isnan(fy))=0;

for i=1:N;
    
    ssx = gamma*xs - kappa*interp2(fx,xs,ys);
    ssy = gamma*ys - kappa*interp2(fy,xs,ys);
    
    %calculating the new position of snake
    xs = Ainv * ssx;
    ys = Ainv * ssy;
    
    
    %Displaying the snake in its new position
    imshow(image,[]); 
    hold on;
    
    %plot([xs; xs(1)], [ys; ys(1)], 'b-'); for closed
    plot(xs, ys, 'm-');%for open
    
    hold off;
    pause(0.001)    
end;

end