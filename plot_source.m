function plot_source(J,vol,grid,col,fa)    

    map=ones(100,3);
        for i=1:100
            map(i,1)=1;
            map(i,2)=1-i*(1/100);
            map(i,3)=1;
        end
        colormap(map)
    hold on   
    p = patch('Faces',vol.cortex.tri,'Vertices',vol.cortex.pos);
    p.FaceColor = col;
    p.FaceAlpha = fa;
    p.EdgeColor = 'none';
%     p.FaceVertexAlphaData = 0.2; 
set(gcf,'color','w');

    hold on
    
    light('Position',[-50 -15 29])
    set(gca,'CameraPosition',[208 -50 7687])
    lighting phong

% xlabel('x','FontSize',24,'FontWeight','bold','Color','k');
% ylabel('y','FontSize',24,'FontWeight','bold','Color','k');
% zlabel('z','FontSize',24,'FontWeight','bold','Color','k');
% set(gca,'Color','[1 1 1]','xLim',[-100 100],'yLim',[-100 100],'zLim',[-100 100]);
% % % % set(gcf,'color','[0.5 0.9 1]','alpha',0.5);
% whitebg([0.5 0.9 1]);
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperPosition', [2 2 3 3]);
% set(gcf, 'rend','painters','pos',[30 40 900 600]);
% view(-80,3);
% view(-42,2);
% view(-25,5);

% view(86,2);

% view(86,8);
% view(-100,5);
axis off
% view(-90,0);
% ax = gca;
% ax.Color = 'k';
% ax.FontSize = 33;
% ax.FontWeight = 'bold';
% view([0,90]);
view([0,90]);
aa = 5;
scatter3(grid.dipos(:,1)+2,grid.dipos(:,2),grid.dipos(:,3)+aa,22,J,'filled');
%     hold off
end