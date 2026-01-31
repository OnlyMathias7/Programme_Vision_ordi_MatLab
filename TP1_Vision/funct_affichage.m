function [] = funct_affichage(vectnorm)
    figure

for i = 1:2

    subplot(1,2,i)
    hold on
    grid on
    axis equal

    r = sqrt(2);
    r2 = sqrt(3);

    if i == 1
        %% ===== CAS 2D =====
        % Points
        plot(vectnorm{i}(1,:), vectnorm{i}(2,:), 'x', 'LineWidth', 1.5)

        % Cercle
        theta = linspace(0, 2*pi, 200);
        x = r*cos(theta);
        y = r*sin(theta);
        plot(x, y, 'b', 'LineWidth', 2)

        % Origine
        plot(0, 0, 'ro', 'MarkerFaceColor','r')

        xlabel('X')
        ylabel('Y')
        title('Points 2D + cercle (rayon \surd2)')

    else
        %% ===== CAS 3D =====
        % Points
        plot3(vectnorm{i}(1,:), vectnorm{i}(2,:), vectnorm{i}(3,:), ...
              'x', 'LineWidth', 1.5)

        % Sphère
        [Xs, Ys, Zs] = sphere(40);
        surf(r2*Xs, r2*Ys, r2*Zs, ...
             'FaceAlpha', 0.2, 'EdgeColor', 'none')

        % Origine
        plot3(0, 0, 0, 'ro', 'MarkerFaceColor','r')

        xlabel('X')
        ylabel('Y')
        zlabel('Z')
        title('Points 3D + sphère (rayon \surd3)')
        view(3)
        camlight
        lighting gouraud
    end

end
end