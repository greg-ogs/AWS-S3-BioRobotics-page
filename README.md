# Robotics: AWS S3 Bucket Infrastructure Testing Project

## Project Overview

This project demonstrates infrastructure testing and deployment using AWS S3 buckets with OpenTofu (formerly Terraform) for provisioning and management. The primary focus is on creating reproducible, reliable cloud infrastructure for the Roboticas application.

## Key Features

- **Infrastructure as Code (IaC):** Utilizing OpenTofu for declarative infrastructure management
- **AWS S3 Bucket Configuration:** Comprehensive testing and deployment of S3 storage solutions
- **Automated Infrastructure Provisioning:** Streamlined cloud resource creation and management
- **Multi-Environment Support:** Flexible configurations for different deployment stages

## Prerequisites

- **OpenTofu** (latest version)
- **AWS CLI** configured with appropriate credentials
- **AWS Account** with sufficient permissions
- **Git** for version control

## Infrastructure Components

### S3 Bucket Configuration

- Automated S3 bucket creation
- Configurable bucket settings
- Security and access control implementation
- Testing different bucket configurations

## Getting Started

### Initial Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd roboticas-infrastructure
   ```

2. Initialize OpenTofu:
   ```
   docker-compose run --rm opentofu init
   ```

3. Plan infrastructure changes:
   ```
   docker-compose run --rm opentofu plan
   ```

4. Apply infrastructure:
   ```
   docker-compose run --rm opentofu apply
   ```
5. **Destroy Infrastructure:**
  ```
  docker-compose run --rm opentofu destroy
  ```


## Testing Strategy

### Infrastructure Validation

- **Automated Tests:** Verify S3 bucket configurations
- **Security Checks:** Ensure proper access controls
- **Performance Testing:** Validate bucket performance characteristics

## Security Considerations

- Implement least-privilege access principles
- Use AWS IAM roles and policies
- Enable S3 bucket encryption
- Configure logging and monitoring

## Troubleshooting

- Verify AWS credentials in your environment
- Ensure Docker and Docker Compose are correctly installed
- Check container networking and permissions
- Validate OpenTofu configuration syntax

## Notes for Development

- Always use `docker-compose run --rm opentofu` for consistent execution
- Avoid running OpenTofu commands directly outside the container
- Ensure AWS credentials are properly configured in your environment