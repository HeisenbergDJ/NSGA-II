function gamma = calculateConvergenceMetric(P, P_star)
    % P: 解集矩阵，每一行表示一个解
    % P_star: 参考点集矩阵，每一行表示一个参考点

    % 计算解集 P 中每个点到参考集 P_star 中的最小距离
    distances = zeros(size(P, 1), 1); % 初始化距离向量
    for i = 1:size(P, 1)
        % 计算第 i 个解到参考集 P_star 中每个点的距离
        dists = sqrt(sum((P(i, :) - P_star).^2, 2));
        % 找到最小距离
        distances(i) = min(dists);
    end

    % 计算最小距离的平均值
    gamma = mean(distances);
end