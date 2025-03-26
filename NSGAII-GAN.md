```mermaid
flowchart TD
    A[开始：参数初始化<br>generations, popnum, eta, bounds, objective_fun] --> B[初始化GAN<br>Generator & Discriminator]
    B --> C[生成初始种群 P<br>随机解 + 目标函数评估]
    C --> D[非支配排序 fast_non_dominated_sort<br>得到种群等级Rank]
    D --> E[生成初始子代 Q<br>make_new_pop(P)]
    E --> F{是否达到最大代数？}
    
    F -- 否 --> G[每10代训练一次GAN<br>使用真实/伪造样本训练判别器和生成器]
    G --> H[GAN生成30%子代<br>generate_by_gan()]
    H --> I[传统方式生成70%子代<br>make_new_pop()]
    I --> J[合并为完整子代 Q_t]
    J --> K[合并 P_t 与 Q_t 为 R_t]
    K --> L[非支配排序 + 拥挤度计算<br>选择新一代父代 P_n]
    L --> M[生成新子代 Q_n<br>传统方式生成]
    M --> N[绘图：可视化当前种群 Pareto前沿]
    N --> O[更新 P_t, Q_t，进入下一代]
    O --> F

    F -- 是 --> P[结束：输出最终 Pareto 最优前沿]

    style A fill:#E0F7FA,stroke:#00796B,stroke-width:2px
    style B fill:#FFF3E0,stroke:#F57C00,stroke-width:2px
    style C fill:#E1F5FE,stroke:#0288D1,stroke-width:2px
    style D fill:#F3E5F5,stroke:#8E24AA,stroke-width:2px
    style G fill:#FBE9E7,stroke:#E64A19,stroke-width:2px
    style H fill:#F1F8E9,stroke:#689F38,stroke-width:2px
    style I fill:#F1F8E9,stroke:#689F38,stroke-width:2px
    style L fill:#FCE4EC,stroke:#D81B60,stroke-width:2px
    style N fill:#E3F2FD,stroke:#1976D2,stroke-width:2px
    style P fill:#E8F5E9,stroke:#2E7D32,stroke-width:3px
```
