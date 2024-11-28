resource "aws_iam_policy" "policy" {
  for_each = var.policies
  name     = each.key
  policy   = file(each.value)

  tags = merge(var.default_tags, { Name = each.key })
}

resource "aws_iam_role" "role" {
  name               = "${var.project_name}-${var.environment}-role"
  assume_role_policy = file("${path.module}/policy-templates/trust_policy.json")

  tags = merge(var.default_tags, { Name = "${var.project_name}-${var.environment}-role" })
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  for_each   = aws_iam_policy.policy
  role       = aws_iam_role.role.name
  policy_arn = each.value.arn
}
