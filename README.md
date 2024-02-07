# Apache-Tomcat-Server-Deployment

ProjectStructure:

apache-tomcat-automation/
│
├── terraform/
│   ├── main.tf
│   └── variables.tf
│
├── ansible/
│   ├── install_tomcat.yml
│   └── inventory/
│       └── hosts.ini
│
├── scripts/
│   └── deploy.sh
│
├── docs/
│   ├── README.md
│   ├── INSTALL.md
│   ├── CONFIG.md
│   └── DEPLOYMENT.md
│
├── Jenkinsfile
└── .gitignore
