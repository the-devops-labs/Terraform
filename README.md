# Terraform Infrastructure Projects

**Infrastructure as Code (IaC) | AWS | Terraform | DevOps Automation**

A hands-on collection of Terraform projects focused on cloud infrastructure provisioning, reusable modules, infrastructure organization, and practical Infrastructure as Code workflows.

This repository documents my journey of building maintainable cloud infrastructure using Terraform, with an emphasis on modular design, configuration management, and operational best practices.

---

##  Overview

The objective of this repository is to demonstrate practical knowledge of Terraform and AWS through structured infrastructure projects.

Key areas covered include:

- **Infrastructure as Code:** Define and manage infrastructure using declarative Terraform configurations.
- **Reusable Modules:** Organize infrastructure components into reusable modules.
- **Cloud Networking:** Structure VPC-related infrastructure and network components.
- **Compute and Database Infrastructure:** Organize frontend, backend, and database-related configurations.
- **Load Balancing:** Maintain a dedicated module for Application Load Balancer configuration.
- **Configuration Management:** Use variables, outputs, local values, and environment-oriented directories.
- **Infrastructure Lifecycle:** Initialize, validate, plan, apply, and manage Terraform configurations.
- **Operational Best Practices:** Follow secure credential handling, version control, and cost-aware deployment practices.

##  Technology Stack

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure provisioning and lifecycle management |
| AWS | Cloud infrastructure platform |
| HCL | Terraform configuration language |
| Git | Version control |
| GitHub | Source code hosting and project documentation |
| VS Code | Infrastructure development |

##  Projects

### Project 1 — VPC Module and Infrastructure Configuration

**Directory:** `Project1/`

This project contains Terraform configuration organized around a VPC module, with separate files for providers, variables, outputs, and development-specific variable values.

**Key configuration areas:**
- Main Terraform configuration
- Reusable VPC module
- Input variables and output values
- Provider configuration
- Development variable file (`dev.tfvars`)
- User-data template (`userdata.tpl`)
- Infrastructure graph (`graph.svg`)

**Terraform concepts:** Modules, variables, outputs, provider configuration, variable files, and infrastructure dependencies.

### Project 2 — Modular AWS Infrastructure

**Directory:** `Project2/`

This project organizes AWS infrastructure into separate Terraform modules to improve maintainability, reuse, and separation of responsibilities.

**Modules:**

| Module | Purpose |
|---|---|
| `VPC` | VPC and networking-related infrastructure |
| `ALB` | Application Load Balancer-related infrastructure |
| `RDS` | Relational database-related infrastructure |
| `frontend_ec2` | Frontend EC2-related infrastructure |
| `backend_ec2` | Backend EC2-related infrastructure |

The module structure separates each component's main configuration, input variables, and output values.

**Terraform concepts:**
- Reusable modules
- Input variables and output values
- Modular infrastructure organization
- Local values and centralized configuration
- Environment-oriented directory structure
- Infrastructure dependencies and lifecycle management

**Objective:** Build a modular AWS infrastructure configuration that is easier to understand, maintain, and extend.

### Project 3 — Independent Terraform Configuration

**Directory:** `Project3/`

This project contains a separate Terraform configuration with dedicated main, provider, and Terraform settings files.

**Key configuration areas:**
- Main Terraform configuration
- Provider configuration
- Terraform settings and requirements

**Objective:** Practice organizing and managing an independent Terraform configuration.

> Project descriptions reflect the repository structure. The actual resources, architecture, and deployment behavior should be verified against the Terraform configuration files.

##  Repository Structure

```text
Terraform/
├── README.md
├── .gitignore
│
├── Project1/
│   ├── main.tf
│   ├── variables.tf
│   ├── output.tf
│   ├── providers.tf
│   ├── dev.tfvars
│   ├── userdata.tpl
│   ├── graph.svg
│   └── modules/
│       └── vpc/
│
├── Project2/
│   ├── main.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── providers.tf
│   ├── graph.dot
│   ├── envs/
│   └── modules/
│       ├── ALB/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       ├── RDS/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       ├── VPC/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       ├── backend_ec2/
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   └── variables.tf
│       └── frontend_ec2/
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
│
└── Project3/
    ├── main.tf
    ├── provider.tf
    └── terraform.tf
```

## ⚙️ Prerequisites

Before running a project, ensure you have:

- Terraform CLI installed
- AWS CLI installed
- An AWS account
- Appropriate AWS IAM permissions
- Git installed
- Basic knowledge of AWS and Terraform

Verify your installations:

```bash
terraform version
aws --version
git --version
```

Configure AWS authentication using an approved method, such as an AWS CLI profile or IAM role.

Never hardcode AWS credentials in Terraform files.

##  Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/the-devops-labs/Terraform.git
cd Terraform
```

### 2. Choose a project

For example:

```bash
cd Project2
```

Review the root configuration, module references, and environment-specific settings before running Terraform.

### 3. Initialize Terraform

```bash
terraform init
```

This initializes the working directory and downloads the required provider plugins and modules.

### 4. Format and validate

```bash
terraform fmt -check -recursive
terraform validate
```

Run the commands from the relevant Terraform root directory. Validation requires successful initialization and the configuration's required inputs and providers to be defined appropriately.

### 5. Review the execution plan

```bash
terraform plan
```

If a project requires a particular variable file, pass it explicitly:

```bash
terraform plan -var-file="dev.tfvars"
```

Use the correct path and filename for the selected project. The `dev.tfvars` example applies to Project 1 only if that file supplies the required inputs.

### 6. Apply the configuration

After reviewing the plan, IAM permissions, and potential AWS charges:

```bash
terraform apply
```

For a project that requires the development variable file:

```bash
terraform apply -var-file="dev.tfvars"
```

Only apply changes when you understand which resources Terraform intends to create, modify, or destroy.

##  Terraform Workflow

The typical infrastructure workflow is:

```text
Configuration
     |
     v
terraform fmt
     |
     v
terraform init
     |
     v
terraform validate
     |
     v
terraform plan
     |
     v
Review Changes
     |
     v
terraform apply
     |
     v
Verify Infrastructure
     |
     v
Cleanup When Required
```

This workflow supports consistent configuration, validation, and controlled infrastructure changes.

##  Security and Best Practices

Security and operational safety are important when managing infrastructure as code.

- **Credential management:** Never commit access keys, passwords, tokens, or private keys.
- **State protection:** Do not commit Terraform state files because they may contain sensitive information.
- **Provider version control:** Track `.terraform.lock.hcl` where appropriate to preserve provider selections.
- **Least privilege:** Grant only the AWS IAM permissions required for the deployment.
- **Plan review:** Inspect Terraform plans before applying changes.
- **Cost management:** Review resource types, regions, and potential recurring charges.
- **Git hygiene:** Exclude local caches, state files, credentials, and real secret-containing variable files.
- **Remote state:** For collaborative use, configure an appropriately secured remote backend and suitable state-locking mechanism.
- **Configuration quality:** Keep infrastructure components organized and use variables and outputs where they improve reuse and clarity.

##  Cleanup

After testing, review which resources Terraform proposes to destroy:

```bash
terraform plan -destroy
```

If the plan is correct and you are authorized to remove those resources:

```bash
terraform destroy
```

Run cleanup from the correct Terraform root directory and use the appropriate backend and variable configuration.

**Warning:** Never destroy shared or production resources without authorization and a careful review.

## 📈 Continuous Improvement

This repository is intended to evolve as additional infrastructure scenarios are implemented and tested.

Planned areas for improvement include:

- More reusable Terraform modules
- Better environment separation
- Infrastructure architecture diagrams
- Automated formatting and validation checks
- Security and configuration validation
- Improved documentation of deployment decisions

These items will be added as they are implemented and verified.

##  Author

**The DevOps Lab**

GitHub: [@the-devops-labs](https://github.com/the-devops-labs)

---

*Building infrastructure as code. Improving through automation. Learning by doing.*
