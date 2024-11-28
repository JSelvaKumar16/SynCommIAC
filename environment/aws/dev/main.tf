module "network" {
  source               = "../../modules/network"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_count  = 2
  private_subnet_count = 2
  public_subnet_cidrs  = ["10.0.1.0/28", "10.0.2.0/28"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  project_name         = var.project_name
  environment          = var.environment
  default_tags         = { Environment = var.environment, Project = var.project_name }
}

module "compute" {
  source         = "../../modules/compute"
  instance_count = 2
  private_instance_count = 1
  ami_id         = "ami-12345678"
  instance_type  = "t2.micro"
  subnet_id      = module.network.private_subnets[0]
  vpc_id         = module.network.vpc_id
  ingress_port   = 22
  ingress_protocol = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  project_name   = var.project_name
  environment    = var.environment
  default_tags   = { Environment = var.environment, Project = var.project_name }
}

module "storage" {
  source        = "../../modules/storage"
  project_name  = var.project_name
  environment   = var.environment
  default_tags  = { Environment = var.environment, Project = var.project_name }
}

module "database" {
  source              = "../../modules/database"
  create_db           = true
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = "dev_db"
  username            = "admin"
  password            = "supersecret"
  parameter_group     = "default.mysql8.0"
  publicly_accessible = false
  skip_final_snapshot = true
  security_group_ids  = [module.network.vpc_security_group_id]
  subnet_ids          = module.network.private_subnets
  project_name        = var.project_name
  environment         = var.environment
  default_tags        = { Environment = var.environment, Project = var.project_name }
}

module "billing" {
  source                = "../../modules/billing"
  budget_limit          = var.budget_limit
  notification_threshold = var.notification_threshold
  notification_email     = var.notification_email
  project_name           = var.project_name
  environment            = var.environment
  default_tags           = { Environment = var.environment, Project = var.project_name }
}

module "iam" {
  source       = "../../modules/iam"
  policies     = {
    ec2_policy       = "../../modules/iam/policy-templates/ec2_policy.json"
    s3_policy        = "../../modules/iam/policy-templates/s3_policy.json"
    iam_policy       = "../../modules/iam/policy-templates/iam_policy.json"
    compute_fed  = "../../modules/iam/policy-templates/compute_fed_policy.json"
    gcs_fed      = "../../modules/iam/policy-templates/gcs_fed_policy.json"
  }
  project_name = var.project_name
  environment  = var.environment
  default_tags = { Environment = var.environment, Project = var.project_name }
}
