# Project 4: Terraform AWS Data Sources – Discover Existing Infrastructure

##  Project Overview

This project demonstrates how to use **Terraform Data Sources** to retrieve information about existing AWS infrastructure and reuse that information when provisioning new resources.

Instead of recreating infrastructure that already exists, Terraform can query AWS and make the retrieved information available to other Terraform configurations.

In this hands-on project, I used Terraform Data Sources to:

- Retrieve an existing AWS VPC.
- Retrieve an existing private subnet.
- Dynamically discover the latest matching Ubuntu 24.04 LTS AMI.
- Reuse the retrieved information to configure a new EC2 instance.

The objective is to understand how Terraform can work with existing AWS infrastructure while provisioning additional resources.

##  Project Objectives

- Understand the difference between Terraform Resources and Data Sources.
- Retrieve an existing AWS VPC using a Data Source.
- Retrieve an existing private subnet using a Data Source.
- Dynamically discover the latest Ubuntu 24.04 LTS AMI.
- Reference Data Source attributes inside Terraform resource blocks.
- Understand how Terraform reads and interacts with existing AWS infrastructure.

##  Architecture

The following diagram represents the infrastructure workflow implemented in this project.

```text
                    AWS CLOUD
                        |
             Existing Infrastructure
                        |
          +-------------+-------------+
          |                           |
       Existing VPC               Ubuntu AMI
          |                           |
     Private Subnet                AMI Lookup
          |                           |
          +-------------+-------------+
                        |
                 Terraform
                Data Sources
                        |
                Retrieved IDs
                        |
                 EC2 Resource
                        |
                New EC2 Instance
                  (t3.micro)
                        |
                Existing Private
                     Subnet
```

##  AWS Resources

| AWS Resource   | Implementation | Purpose                                      |
| -------------- | -------------- | -------------------------------------------- |
| VPC            | Existing       | Retrieved using the `aws_vpc` Data Source    |
| Private Subnet | Existing       | Retrieved using the `aws_subnet` Data Source |
| Ubuntu AMI     | Existing       | Discovered using the `aws_ami` Data Source   |
| EC2 Instance   | New            | Configured using the `aws_instance` Resource |

### AWS Configuration

| Configuration        | Value                   |
| -------------------- | ----------------------- |
| AWS Region           | `ap-south-1`            |
| AMI Operating System | Ubuntu Server 24.04 LTS |
| Architecture         | `x86_64`                |
| AMI Owner            | Canonical               |
| Instance Type        | `t3.micro`              |
| Deployment Subnet    | Existing private subnet |

##  Project Structure

```text
Project4/
│
├── provider.tf
├── variables.tf
├── data-source.tf
├── main.tf
├── terraform.tfvars
├── .gitignore
└── README.md
```

*Note: The structure above is illustrative. Adjust the file names to match the actual files in Project4.*

##  Terraform Concepts Implemented

### 1. VPC Data Source

Used the `aws_vpc` Data Source to retrieve information about an existing VPC using its VPC ID.

This allows Terraform to reference an existing VPC without creating another one.

### 2. Subnet Data Source

Used the `aws_subnet` Data Source to retrieve information about an existing private subnet using its subnet ID.

The retrieved subnet ID is then referenced in the EC2 instance configuration.

### 3. AMI Data Source

Used the `aws_ami` Data Source to dynamically discover the latest matching Ubuntu 24.04 LTS AMI.

The selection criteria include:

- Canonical as the AMI owner.
- Ubuntu Server 24.04 LTS.
- `x86_64` architecture.
- Most recent matching AMI.

This approach avoids hardcoding an AMI ID that may become outdated.

### 4. EC2 Resource

Configured a new EC2 instance using information retrieved from the Data Sources.

The instance configuration includes:

- Dynamically retrieved Ubuntu AMI ID.
- `t3.micro` instance type.
- Dynamically retrieved private subnet ID.
- Name tag: `data-source-ec2`.

##  Prerequisites

Before running this project, make sure you have:

- An AWS account.
- AWS CLI installed and configured.
- Terraform installed.
- Appropriate AWS IAM permissions.
- An existing VPC and private subnet in `ap-south-1`.
- AWS credentials configured securely outside the Terraform configuration.

##  How to Execute

### Step 1: Clone the Repository

```bash
git clone https://github.com/the-devops-labs/Terraform.git
cd Terraform/Project4
```

### Step 2: Initialize Terraform

```bash
terraform init
```

### Step 3: Format Terraform Configuration

```bash
terraform fmt
```

### Step 4: Validate the Configuration

```bash
terraform validate
```

### Step 5: Review the Execution Plan

```bash
terraform plan
```

Review the proposed changes before proceeding.

### Step 6: Apply the Configuration

After reviewing the execution plan and confirming the proposed changes:

```bash
terraform apply
```

Review the AWS resources and potential charges before approving the deployment.

##  Validation Results

The Data Sources were successfully tested using `terraform plan`.

| Data Source                   | Result                    |
| ----------------------------- | ------------------------- |
| Existing VPC                  | Successfully retrieved    |
| Existing Private Subnet       | Successfully retrieved    |
| Ubuntu AMI                    | Successfully retrieved    |
| Initial Data Source-only Plan | No infrastructure changes |

The initial Data Source-only execution returned:

```text
No changes. Your infrastructure matches the configuration.
```

This confirms that Terraform successfully retrieved the existing AWS infrastructure information without creating or modifying resources during that initial plan.

**Current project status:**

- Data Sources: Successfully tested.
- EC2 Resource: Configuration added.
- EC2 Deployment: Pending deployment validation.

##  Key Learnings

Through this hands-on implementation, I learned:

1. How Terraform Data Sources work.
2. How to retrieve existing AWS resources without recreating them.
3. How to dynamically discover AMIs using filters.
4. How to reference Data Source attributes inside resource blocks.
5. How Terraform distinguishes between managing infrastructure and reading existing infrastructure.
6. Why a Data Source can fail if the referenced AWS resource no longer exists or cannot be accessed.

### Resource vs Data Source

| Resource                            | Data Source                                          |
| ----------------------------------- | ---------------------------------------------------- |
| Creates and manages infrastructure. | Retrieves information about existing infrastructure. |
| Uses the `resource` block.          | Uses the `data` block.                               |
| Example: `aws_instance`             | Example: `aws_ami`                                   |

##  Best Practices

- Avoid hardcoding AMI IDs when dynamic discovery is appropriate.
- Use variables for configurable infrastructure values.
- Use specific AMI filters to avoid selecting unintended images.
- Keep AWS credentials outside Terraform configuration files.
- Never commit secret keys, passwords, or sensitive `.tfvars` files.
- Review Terraform plans before applying changes.
- Protect Terraform state files because they can contain sensitive information.
- Verify subnet routing and security group configuration before deploying EC2 instances.

##  Official Documentation

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Data Source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc)
- [AWS Subnet Data Source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet)
- [AWS AMI Data Source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)
- [AWS EC2 Instance Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
- [Canonical Ubuntu on AWS](https://ubuntu.com/aws)

---

##  Author

**Omvir Singh | AI Infrastructure Engineer | DevOps Engineer**

Learning and implementing AWS, Terraform, DevOps, Infrastructure as Code, and Cloud Automation through hands-on projects.

**Learn. Build. Automate. Repeat. 🚀**
