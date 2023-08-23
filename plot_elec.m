function plot_elec(phi,elec)
ne = size(elec.chanpos);
n = ne(1,1);
a = 1:n;
b = num2str(a');
c = cellstr(b);
aa = 200;
map=ones(100,3);
scm = abs(min(phi))/(max(phi)+abs(min(phi)))*100;
for i=1:101
    map(i,1) = 1;
    if(i<=scm)
        map(i,2) = 0+(1/scm)*(i-1);
        map(i,3) = 1;
    else
            map(i,2) = (1-(1/(102-scm))*(i-scm+1));
            map(i,3) = (1-(1/(102-scm))*(i-scm+1));
    end
end
figure('units','normalized','outerposition',[0 0 1 1])
colormap(map)

elec.chanpos(:,1) = -1.4*elec.chanpos(:,1);
elec.chanpos(:,2) = -1.2*elec.chanpos(:,2);
elec.chanpos(:,3) = 1.4*elec.chanpos(:,3)-55;

% elec.chanpos(:,1) = elec.chanpos(:,1);
% elec.chanpos(:,2) = elec.chanpos(:,2);
% elec.chanpos(:,3) = elec.chanpos(:,3);

trinew = delaunay(elec.chanpos(:,1),elec.chanpos(:,2),elec.chanpos(:,3));

ee = 1.14;
trimesh(trinew,elec.chanpos(:,1),elec.chanpos(:,2),elec.chanpos(:,3),phi,'FaceAlpha',1, 'EdgeColor',...
    'none','FaceColor','interp','EdgeAlpha',0)
hold on

text(elec.chanpos(:,1)*ee,elec.chanpos(:,2)*ee,elec.chanpos(:,3)*ee,c,'Color', 'k','FontWeight',...
    'bold','FontSize',24);
    plot3(1.08*elec.chanpos(:,1),1.08*elec.chanpos(:,2),1.08*elec.chanpos(:,3),...
        'bo','MarkerSize', 11, 'MarkerFaceColor', 'b');
xlabel('x','FontSize',55,'FontWeight','bold','Color','k');
ylabel('y','FontSize',55,'FontWeight','bold','Color','k');
zlabel('z','FontSize',55,'FontWeight','bold','Color','k');
% set(gca,'Color','w','xLim',[-aa aa],'yLim',[-aa+40 aa-40],'zLim',[-aa aa-90]);
% set(gca,'Color','k','xLim',[-aa aa],'yLim',[-aa aa],'zLim',[-aa aa]);
set(gcf,'color','w');
% set(gcf,'color',[0.6 0.87 1]);

% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperPosition', [2 2 3 3]);
% set(gcf, 'rend','painters','pos',[30 40 900 600]);
% print('fillpage');

% view(-90,0);
view(67,7);
% title('Head and EEG electrodes');
% title('Scalp distribution');
% view(0,5);
ax = gca;
ax.Color = 'w';
ax.FontSize = 33;
ax.FontWeight = 'bold';
axis off
hold off
% legend(['\color{white}','in \muV'])
% legend(['in mV'])
colorbar
end