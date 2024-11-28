resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(var.default_tags, {
    Name       = "${var.project_name}-${var.environment}-instance-${count.index + 1}"
    Environment = var.environment
    Project     = var.project_name
  })
}

resource "aws_security_group" "main" {
  name_prefix = "${var.project_name}-${var.environment}-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.default_tags, {
    Name       = "${var.project_name}-${var.environment}-sg"
    Environment = var.environment
    Project     = var.project_name
  })
}

resource "aws_instance" "private_instance" {
  count         = var.private_instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = merge(var.default_tags, {
    Name       = "${var.project_name}-${var.environment}-private-instance-${count.index + 1}"
    Environment = var.environment
    Project     = var.project_name
  })
}
