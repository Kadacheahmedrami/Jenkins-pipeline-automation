

# Jenkins CI/CD Pipeline Flow

```mermaid
flowchart LR
    A[🔧 Local Testing] --> B[📂 GitHub Push]
    B --> D[⚙️ Jenkins]
    
    subgraph "Google Cloud VPS"
        D
        E[🐳 Docker Build]
        F[🚀 Deploy]
        G[📦 MySQL DB]
        H[🌐 WordPress]
        I[🔧 phpMyAdmin]
        J[🛡️ Nginx Proxy]
    end
    D --> E
    E --> F
    F --> G
    F --> H
    F --> I
    F --> J
    
    subgraph "Security Features"
        K[🚦 Rate Limiting]
        L[🗜️ Gzip Compression]
        M[🔒 Security Headers]
        N[🚫 Bot Protection]
    end
    
    J --> K
    J --> L
    J --> M
    J --> N
    
    style A fill:#ff6b6b,stroke:#333,stroke-width:2px,color:#fff
    style B fill:#4ecdc4,stroke:#333,stroke-width:2px,color:#fff

    style D fill:#96ceb4,stroke:#333,stroke-width:2px,color:#fff
    style E fill:#feca57,stroke:#333,stroke-width:2px,color:#fff
    style F fill:#ff9ff3,stroke:#333,stroke-width:2px,color:#fff
    style G fill:#e74c3c,stroke:#333,stroke-width:2px,color:#fff
    style H fill:#3498db,stroke:#333,stroke-width:2px,color:#fff
    style I fill:#9b59b6,stroke:#333,stroke-width:2px,color:#fff
    style J fill:#2ecc71,stroke:#333,stroke-width:2px,color:#fff
    style K fill:#f39c12,stroke:#333,stroke-width:2px,color:#fff
    style L fill:#1abc9c,stroke:#333,stroke-width:2px,color:#fff
    style M fill:#e67e22,stroke:#333,stroke-width:2px,color:#fff
    style N fill:#c0392b,stroke:#333,stroke-width:2px,color:#fff
```


# DevOps Infrastructure Documentation



## Docker Architecture

```mermaid
graph TD
    A[Client Request 1] --> D[Nginx Proxy Load Balancer<br/>Port 80]
    B[Client Request 2] --> D
    C[Client Request 3] --> D
    
    D --> E[WordPress Container<br/>Instance 1]
    D --> F[WordPress Container<br/>Instance 2]
    D --> G[phpMyAdmin Container<br/>Local Only]
    
    E --> H[MySQL Database<br/>Persistent]
    F --> H
    G --> H
    
    style D fill:#e1f5fe
    style E fill:#f3e5f5
    style F fill:#f3e5f5
    style G fill:#fff3e0
    style H fill:#e8f5e8
```

## Load Balancing Architecture

```mermaid
graph TD
    A[Internet Traffic] --> B[Nginx Load Balancer]
    B --> C[Rate Limiting & Security Headers]
    C --> D[Health Checks & Auto Failover]
    
    D --> E[App1 Container]
    D --> F[App2 Container]
    
    G[Health Monitoring] --> E
    G --> F
    H[Automatic Restart] --> E
    H --> F
    
    E --> I[Database Shared]
    F --> I
    
    style B fill:#e1f5fe
    style E fill:#f3e5f5
    style F fill:#f3e5f5
    style I fill:#e8f5e8
    style G fill:#fff3e0
    style H fill:#fff3e0
```



## Project Timeline (Gantt Chart)

```mermaid
gantt
    title Project Timeline (15 Days)
    dateFormat X
    axisFormat %d
    
    section Infrastructure
    Infrastructure Setup    :done, infra, 1, 8
    
    section Containerization
    Container Setup        :done, container, 3, 10
    
    section Load Balancing
    Load Balancer Config   :done, lb, 6, 13
    
    section Security
    Security Testing       :done, security, 8, 15
    
    section Documentation
    Documentation         :done, docs, 10, 15
    
    section Training
    Team Training         :done, training, 12, 15
    
    section Deployment
    Production Deploy     :done, deploy, 13, 15
```

## Risk Assessment Matrix

```mermaid
quadrantChart
    title Risk Assessment Matrix
    x-axis Low_Probability --> High_Probability
    y-axis Low_Impact --> High_Impact
    
    quadrant-1 Critical Risks
    quadrant-2 High Risks
    quadrant-3 Low Risks
    quadrant-4 Medium Risks
    
    Minor Bugs: [0.2, 0.2]
    Compatibility: [0.3, 0.5]
    Knowledge Transfer: [0.5, 0.5]
    Performance: [0.3, 0.8]
    Security: [0.8, 0.9]
    Data Loss: [0.9, 0.9]
```



## Container Orchestration Flow

```mermaid
graph TD
    A[Docker Compose File] --> B[Build Containers]
    A --> C[Network Creation]
    A --> D[Volumes Mounting]
    
    B --> E[Service Discovery & Health Checks]
    C --> E
    D --> E
    
    E --> F[Load Balancing & Auto Scaling]
    
    style A fill:#e1f5fe
    style B fill:#f3e5f5
    style C fill:#e8f5e8
    style D fill:#fff3e0
    style E fill:#fce4ec
    style F fill:#f1f8e9
```



## System Architecture Overview

```mermaid
graph TB
    subgraph "External"
        U[Users/Clients]
    end
    
    subgraph "Load Balancer Layer"
        LB[Nginx Load Balancer]
    end
    
    subgraph "Application Layer"
        WP1[WordPress Instance 1]
        WP2[WordPress Instance 2]
        PMA[phpMyAdmin]
    end
    
    subgraph "Database Layer"
        DB[MySQL Database]
    end
    
    subgraph "Monitoring"
        MON[Monitoring Dashboard]
        LOG[Log Aggregation]
    end
    
    U --> LB
    LB --> WP1
    LB --> WP2
    LB --> PMA
    
    WP1 --> DB
    WP2 --> DB
    PMA --> DB
    
    MON --> LB
    MON --> WP1
    MON --> WP2
    MON --> DB
    
    LOG --> WP1
    LOG --> WP2
    LOG --> LB
    
    style U fill:#e3f2fd
    style LB fill:#e1f5fe
    style WP1 fill:#f3e5f5
    style WP2 fill:#f3e5f5
    style PMA fill:#fff3e0
    style DB fill:#e8f5e8
    style MON fill:#fce4ec
    style LOG fill:#f1f8e9
```

