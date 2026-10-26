# Terraform Infrastructure Projects

**Infrastructure as Code | AWS | Terraform | Cloud Automation**

A hands-on collection of Terraform projects focused on provisioning cloud infrastructure, organizing reusable configurations, and applying Infrastructure as Code principles to practical DevOps scenarios.

This repository documents my practical work with Terraform, from infrastructure configuration and modular design to environment-specific deployments and infrastructure lifecycle management.

---

## Overview

The objective of this repository is to develop and demonstrate practical skills in:

- **Infrastructure as Code (IaC):** Define and manage infrastructure using declarative Terraform configurations.
- **Modular Design:** Organize configurations into reusable components to improve maintainability.
- **Configuration Management:** Use variables, local values, outputs, and variable files to structure infrastructure definitions.
- **Cloud Networking:** Work with VPC-related resources and network configuration.
- **Infrastructure Lifecycle:** Initialize, validate, plan, deploy, and manage infrastructure changes using Terraform.
- **Operational Practices:** Apply version control, secure credential handling, and cost-aware infrastructure management.

The repository will evolve as additional projects, architecture diagrams, and infrastructure scenarios are implemented and validated.

## Technology Stack

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure provisioning and lifecycle management |
| AWS | Cloud infrastructure and networking |
| HCL | Declarative infrastructure configuration |
| Git and GitHub | Version control and project collaboration |
| VS Code | Infrastructure development and configuration editing |

## Project Directory

### Project 1 — VPC Module and Infrastructure Configuration

**Directory:** `Project1/`

This project organizes Terraform configuration around a VPC module and separates infrastructure definitions, input variables, outputs, provider configuration, and development-specific variable values.

**Configuration areas:**
- Main Terraform configuration
- Input variables and output values
- Provider configuration
- Reusable VPC module
- Development variable file (`dev.tfvars`)
- User-data template (`userdata.tpl`)
- Infrastructure graph (`graph.svg`)

**Concepts explored:** Terraform modules, input variables, outputs, provider configuration, variable files, and infrastructure dependencies.

### Project 2 — Modular and Environment-Oriented Configuration

**Directory:** `Project2/`

This project uses a directory structure that separates environment-related configuration and modules from the main Terraform configuration.

**Configuration areas:**
- Main Terraform configuration
- Variables and local values
- Provider configuration
- Environment directory (`envs/`)
- Modules directory (`modules/`)
- Infrastructure graph (`graph.dot`)

**Concepts explored:** Configuration organization, reusable modules, local values, variables, and environment-specific infrastructure management.

### Project 3 — Independent Terraform Configuration

**Directory:** `Project3/`

This project maintains a separate Terraform configuration with its own main configuration, provider definition, and Terraform settings.

**Configuration areas:**
- Main Terraform configuration
- Provider configuration
- Terraform settings and requirements

**Concepts explored:** Terraform project structure, provider setup, and configuration management.

> Project descriptions summarize the visible repository structure. Refer to the actual Terraform configuration for the resources and functionality implemented in each project.

---

## Repository Structure

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
│
└── Project3/
    ├── main.tf
    ├── provider.tf
    └── terraform.tf
```

## Prerequisites

Before running any project, ensure the following tools and access are available:

- Terraform CLI
- AWS CLI
- An AWS account
- Appropriate AWS IAM permissions
- Git
- A code editor such as VS Code

Verify the installations:

```bash
terraform version
aws --version
git --version
```

Configure AWS credentials using an approved method, such as an AWS CLI profile or IAM role. Do not hardcode credentials in Terraform configuration files.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/the-devops-labs/Terraform.git
cd Terraform
```

### 2. Select a project

For example, to work with Project 1:

```bash
cd Project1
```

Review the configuration and any project-specific variable requirements before proceeding.

### 3. Initialize Terraform

```bash
terraform init
```

Initialization downloads the required provider plugins and prepares the working directory.

### 4. Format and validate the configuration

```bash
terraform fmt -check -recursive
terraform validate
```

Run these commands from the relevant project directory. If the project uses nested modules, review their formatting and validation requirements as well.

### 5. Review the execution plan

For Project 1, if `dev.tfvars` contains the required values:

```bash
terraform plan -var-file="dev.tfvars"
```

For other projects, use the variable files and configuration instructions applicable to those projects.

### 6. Apply the configuration

After reviewing the proposed changes, resource permissions, and estimated costs:

```bash
terraform apply -var-file="dev.tfvars"
```

Use the variable-file argument only for projects that require that file. For other projects, follow their configuration requirements.

**Important:** Terraform may create billable AWS resources. Apply changes only when you understand the proposed infrastructure and have permission to create it.

---

## Terraform Workflow

The standard workflow for these projects is:

```text
Write Configuration
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
Verify Resources
        |
        v
Clean Up When Appropriate
```

The plan should be reviewed before applying changes. For shared or production infrastructure, use an appropriate review and approval process rather than applying changes without authorization.

## Security and Operational Practices

Infrastructure automation must account for security, reliability, and cost.

- **Credential security:** Never commit AWS access keys, secret keys, passwords, or private keys.
- **State protection:** Do not commit Terraform state files. State can contain sensitive values.
- **Provider consistency:** Keep `.terraform.lock.hcl` under version control where appropriate to preserve selected provider versions.
- **Least privilege:** Use only the IAM permissions required for the task.
- **Change review:** Inspect Terraform plans before applying changes.
- **Cost awareness:** Review resource types, regions, and ongoing charges before deployment.
- **Configuration hygiene:** Keep generated files, local caches, and sensitive variable files out of Git.
- **State management:** Use an appropriately secured remote backend and locking mechanism when required by the project and supported by the chosen backend configuration.

## Cleanup

When infrastructure is no longer required, first review the resources Terraform proposes to destroy:

```bash
terraform plan -destroy
```

If the plan is correct, and you have confirmed that the resources are safe to remove:

```bash
terraform destroy
```

Run these commands from the correct project directory and use the same backend and variable configuration as the deployment where required.

Never destroy shared or production infrastructure without authorization and a careful review.

## Continuous Improvement

This repository is maintained as a practical Infrastructure as Code portfolio. The focus is on building understandable configurations, improving modularity, validating infrastructure changes, and documenting implementation decisions.

Future improvements may include additional cloud infrastructure scenarios, automated Terraform checks, stronger security validation, and expanded architecture documentation as those features are implemented.

## Author

**The DevOps Lab**

GitHub: [the-devops-labs](https://github.com/the-devops-labs)

---

*Learning by building. Improving through automation. Managing infrastructure as code.*
